from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from test02.api.routes.books import create_book

app = Flask(__name__)

app.config["SQLALCHEMY_DATABASE_URI"] = "mysql+pymysql://root:12345678@localhost:3306/test_db"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False


db = SQLAlchemy()
db.init_app(app)

app.register_blueprint(create_book)

if __name__ == '__main__':
  app.run(debug=True)


