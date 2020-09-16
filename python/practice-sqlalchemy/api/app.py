from flask import Flask, render_template, make_response

# from api.model.User import User
# from api.model.Person import Person
# from api.model.Address import Address

from api.model.Category import Category
from api.model.Post import Post

from api.utils.database import db
from api.config.config import Config

def create_app(test_config=None):  # 1)
    app = Flask(__name__)
    app_config = Config
    app.config.from_object(app_config)
    db.init_app(app)
    with app.app_context():
        db.create_all()


    @app.route("/test/insert-post",methods=["GET","POST"])
    def add_post():
        py = Category(id=1,name="hennie")
        p = Post(title='Snakes2', body='Ssssssss2',category_id=py.id)
        # py.posts.append(p)
        db.session.add(p)
        db.session.commit()

        return "success"



    @app.route("/test/insert-category",methods=["GET"])
    def get_category():
        category1= Category(id=6,name="checkcommit")
        db.session.add(category1)
        db.session.commit()

        return "success"

    @app.route("/test/get-all-post", methods=["GET"])
    def get_post():
        res1 = Post.query.all()
        res2 =  Post.query.get(2)
        print(res2)
        return "success"


    # @app.route("/test/add" , methods=["GET"])
    # def add_user():
    #     User1 = User(username="hennie3",email="pulovelty@nav" , password="124312")
    #     User1.create()
    #     return "success"
    #
    #
    #
    #
    # @app.route("/test/get-all",methods=["GET"])
    # def get_users():
    #     res1= User.query.all()
    #
    #     return "success"
    #
    # @app.route("/test/get-detail",methods=["GET"])
    # def get_detail():
    #
    #     res1 = User.query.filter_by(id =2)
    #     print(res1 is None)
    #     for elm in res1:
    #         print(elm.username)
    #
    #     res2 = User.query.order_by(User.username).all()
    #     res3 = User.query.limit(1).all()
    #     res4 = User.query.get(2)
    #
    #     print("res2 :" , res2)
    #     print("res3 :" , res3)
    #     print("res4 : ", res4)
    #     return "success"
    #
    # @app.route('/test/user/<username>')
    # def show_user(username):
    #
    #     user = User.query.filter_by(username=username).all()
    #
    #     if len(user)==0:
    #         return "fail"
    #
    #     return "success"





    @app.route("/")
    def main():
        return "pong"

    return app

app = create_app()








if __name__ == "__main__":
    app.run(debug=True, host='127.0.0.1', port=5000)