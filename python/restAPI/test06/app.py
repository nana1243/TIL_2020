# app.py
import config

from flask import Flask
from sqlalchemy import create_engine
from flask_cors import CORS

from model import UserDao, TweetDao  # 1)
from service import UserService, TweetService  # 2)
from view import create_endpoints  # 3)


class Services:  # 4)
    pass


################################
# Create App
################################
def create_app(test_config=None):
    app = Flask(__name__)

    CORS(app)

    if test_config is None:
        app.config.from_pyfile("config.py")
    else:
        app.config.update(test_config)

    database = create_engine(app.config['DB_URL'], encoding='utf-8', max_overflow=0)

    ## Persistenace Layer
    user_dao = UserDao(database)  # 5)
    tweet_dao = TweetDao(database)

    ## Business Layer
    services = Services  # 6)
    services.user_service = UserService(user_dao, config)
    services.tweet_service = TweetService(tweet_dao)

    ## 엔드포인트들을 생성
    create_endpoints(app, services)  # 7)

    return app