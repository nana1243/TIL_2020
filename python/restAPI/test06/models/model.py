from sqlalchemy import text


class UserDao:  # 1)
    def __init__(self, database):  # 2)
        self.db = database

    def insert_user(self, user):
        return self.db.execute(text("""			
    	INSERT INTO users (
        	name,
            email,
            profile,
            hashed_password
        ) VALUES (
        	:name,
            :email,
            :profile,
            :password
        )
    """), user).lastrowid