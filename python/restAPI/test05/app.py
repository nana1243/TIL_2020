
from flask.json import JSONEncoder  # 1)
from flask import Flask, jsonify, request
from sqlalchemy import create_engine


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

    return app

app=create_app()


app.users = {}  # 2)
app.id_count = 1  # 3)

@app.route("/signup", methods=['POST'])  # 4)
def signup():
    new_user = request.json  # 5) http 요청을 통해 전송된 회원정보를 읽어들인다
    new_user["id"] = app.id_count  # 6)
    app.users[app.id_count] = new_user  # 7)
    app.id_count = app.id_count + 1  # 8)

    return jsonify(new_user)

@app.route("/ping", methods=['GET'])
def ping():
    return "pong"


app.twitter = []

@app.route("/twit", methods=['POST'])  # 2)
def twitter():  # 3)
    payload = request.json
    user_id = int(payload['id'])
    twitter = payload['twitter']

    if user_id not in app.users:  # 4)
        return '사용자가 존재하지 않습니다.', 400

    if len(twitter) > 300:  # 5)
        return '300자를 초과했습니다.', 400

    user_id = int(payload['id'])  # 6)
    app.twitter.append({  # 7)
        'user_id': user_id,
        'twitter': twitter
    })

    return '', 200


@app.route("/follow", methods=['POST'])
def follow():
    payload = request.json
    user_id = int(payload['id'])  # 1)
    user_id_to_follow = int(payload['follow'])  # 2)
    if user_id not in app.users or user_id_to_follow not in app.users:  # 3)
        return '사용자가 존재하지 않습니다.', 400
    user = app.users[user_id]  # 4)
    user.setdefault('follow', set()).add(user_id_to_follow)  # 5)
    return jsonify(user)


@app.route('/unfollow', methods=['POST'])
def unfollow():
    payload           = request.json
    user_id           = int(payload['id'])
    user_id_to_follow = int(payload['unfollow'])	# 1)

    if user_id not in app.users or user_id_to_follow not in app.users:	# 2)
        return '유저가 존재 하지 않습니다', 400

    user = app.users[user_id]
    user.setdefault('follow', set()).discard(user_id_to_follow)		# 3)

    return jsonify(user)

@app.route('/timeline/<int:user_id>', methods=['GET'])	# 1)
def timeline(user_id):	# 2)
    if user_id not in app.users:
        return '유저가 존재 하지 않습니다', 400

    follow_list = app.users[user_id].get('follow', set())	# 3)
    follow_list.add(user_id)	# 4)
    timeline = [tweet for tweet in app.twitter if tweet['user_id'] in follow_list]	# 5)

    return jsonify({	# 6)
        'user_id'  : user_id,
        'timeline' : timeline
    })



if __name__ == '__main__':
    app.run(debug=True)