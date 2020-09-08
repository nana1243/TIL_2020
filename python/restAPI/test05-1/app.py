import time

from flask.json import JSONEncoder  # 1)
from flask import Flask, jsonify, request, current_app
from sqlalchemy import create_engine, text


class CustomJSONEncoder(JSONEncoder):  # 2)
    def default(self, obj):  # 3)
        if isinstance(obj, set):  # 4)
            return list(obj)

        return JSONEncoder.default(self, obj)  # 5)


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
    def sign_up():
        new_user = request.json
        sql="INSERT INTO "+ "users(name,email,profile,hashed_password)"+"VALUES (:name,:email,:profile,:password)"
        new_user_id = app.database.execute(text(sql), new_user).lastrowid  # 2)

        return jsonify(new_user_id)

    @app.route('/tweet', methods=['POST'])
    def tweet():
        user_tweet = request.json
        tweet = user_tweet['tweet']

        sql="INSERT INTO"+"tweets(user_id, tweet)"+" VALUES (:id,:tweet)"

        if len(tweet) > 300:
            return '300자를 초과했습니다', 400

        app.database.execute(text(sql), user_tweet)  # 2)

        return '', 200

    @app.route('/timeline/<int:user_id>', methods=['GET'])
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