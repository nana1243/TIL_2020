#
#
# from api.utils.database import db
#
#
#
# class Address(db.Model):
#     id = db.Column(db.Integer, primary_key=True)
#     email = db.Column(db.String(120), nullable=False)
#     PersonId = db.Column(db.Integer, db.ForeignKey('person.id'),nullable=False)