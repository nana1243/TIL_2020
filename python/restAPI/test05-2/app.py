import datetime
import time
from functools import wraps

import jwt
from _pytest.tmpdir import get_user
from flask.json import JSONEncoder  # 1)
from flask import Flask, jsonify, request, current_app, Response, g
from passlib.handlers import bcrypt
from sqlalchemy import create_engine, text


class CustomJSONEncoder(JSONEncoder):  # 2)
    def default(self, obj):  # 3)
        if isinstance(obj, set):  # 4)
            return list(obj)

        return JSONEncoder.default(self, obj)  # 5)

def login_required(f):      									# 1)
    @wraps(f)                   								# 2)
    def decorated_function(*args, **kwargs):
        access_token = request.headers.get('Authorization') 	# 3)
        if access_token is not None:  							# 4)
            try:
                payload = jwt.decode(access_token, current_app.config['JWT_SECRET_KEY'], 'HS256') 				   # 5)
            except jwt.InvalidTokenError:
                 payload = None     							# 6)

            if payload is None: return Response(status=401)  	# 7)

            user_id   = payload['user_id']  					# 8)
            g.user_id = user_id
            g.user    = get_user(user_id) if user_id else None
        else:
            return Response(status = 401)  						# 9)

        return f(*args, **kwargs)
    return decorated_function

def create_app(test_config=None):  # 1)
    app = Flask(__name__)
    app.json_encoder = CustomJSONEncoder
    if test_config is None:  # 2)
        app.config.from_pyfile("config.py")
    else:
        app.config.update(test_config)

    database = create_engine(app.config['DB_URL'], encoding='utf-8', max_overflow=0)  # 3)
    app.database = database  # 4)

    @app.route("/sign-up", methods=['POST'])
    @login_required
    def sign_up():
        new_user = request.json
        new_user['password'] = bcrypt.hashpw(  # 2)
            new_user['password'].encode('UTF-8'),
            bcrypt.gensalt()
        )
        print(new_user['password'])

        sql="INSERT INTO "+ "users(name,email,profile,hashed_password)"+"VALUES (:name,:email,:profile,:password)"
        new_user_id = app.database.execute(text(sql), new_user).lastrowid  # 2)

        return jsonify(new_user_id)

    @app.route('/login', methods=['POST'])
    @login_required
    def login():
        data = request.json
        email = data['email']  # 2)
        password = data['password']  # 3)

        sql = "select id,hashed_password"+"from users" + "WHERE email = :email"

        row = database.execute(text(sql), {'email': email}).fetchone()

        if row and bcrypt.checkpw(password.encode('UTF-8'),
                                  row['hashed_password'].encode('UTF-8')):  # 5)
            user_id = row['id']
            payload = {  # 6)
                'user_id': user_id,
                'exp': datetime.utcnow() + datetime.timedelta(seconds=60 * 60 * 24)
            }
            token = jwt.encode(payload, app.config['JWT_SECRET_KEY'], 'HS256')  # 7)

            return jsonify({
                'acces_token': token.decode('UTF-8')  # 8)
            })
        else:
            return '', 401

    @app.route('/tweet', methods=['POST'])
    @login_required
    def tweet():
        user_tweet = request.json
        tweet = user_tweet['tweet']

        sql="INSERT INTO"+"tweets(user_id, tweet)"+" VALUES (:id,:tweet)"

        if len(tweet) > 300:
            return '300자를 초과했습니다', 400

        app.database.execute(text(sql), user_tweet)  # 2)

        return '', 200

    @app.route('/timeline/<int:user_id>', methods=['GET'])
    @login_required
    def timeline(user_id):
        sql = "SELECT t.user_id, t.tweet " + "FROM tweets t" +\
              " LEFT JOIN users_follow_list ufl ON ufl.user_id = :user_id"+ \
              "WHERE t.user_id = :user_id" + " OR t.user_id = ufl.follow_user.id"
        rows = app.database.execute(text(sql), {
            'user_id': user_id
        }).fetchall()

        timeline = [{  # 2)
            'user_id': row['user_id'],
            'tweet': row['tweet']
        } for row in rows]

        return jsonify({  # 3)
            'user_id': user_id,
            'timeline': timeline
        })

    return app


app=create_app()




if __name__ == '__main__':
    app.run(debug=True)