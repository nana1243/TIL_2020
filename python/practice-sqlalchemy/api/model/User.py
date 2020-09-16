# from datetime import datetime
#
# from sqlalchemy import engine
# from sqlalchemy.orm import sessionmaker
#
# from api.utils.database import db
# from marshmallow import fields
# from marshmallow_sqlalchemy import ModelSchema
#
# class User(db.Model):
#     __table_name__ = 'user'
#     id = db.Column(db.Integer, primary_key=True)
#     username = db.Column(db.String(100), unique=True, nullable=False)
#     email = db.Column(db.String(100), unique=True, nullable=False)
#     password = db.Column(db.String(100), nullable=False)
#
#     def __init__(self, username,email,password):
#         self.username = username
#         self.email = email
#         self.password = password
#
#     def create(self):
#         db.session.add(self)
#         db.session.commit()
#         return self
#
#
#
#
#
#
#
#
