from passlib.handlers import bcrypt


class UserService:  # 1)

    def __init__(self, user_dao):  # 2)
        self.user_dao = user_dao

    def create_new_user(self, new_user):  # 3)
        new_user['password'] = bcrypt.hashpw(new_user['password'].encode('UTF-8'),  # 4)
                                             bcrypt.gensalt()
                                             )

        new_user_id = self.user_dao.insert_user(new_user)  # 5)
        return new_user_id