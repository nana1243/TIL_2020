from api.models.model_frame import ModelFrame
from api.utils.database import db
from marshmallow_sqlalchemy import ModelSchema
from marshmallow import fields
import pandas as pd
from flask_rest_jsonapi import ResourceList
from sqlalchemy.ext.declarative import DeclarativeMeta
import json
from api.models import model_frame

import json
class ministop(db.Model):
    __tablename__ = 'df_ministop_oneplusone'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    productname = db.Column(db.String(50))
    price = db.Column(db.String(50))
    servicename = db.Column(db.String(50))


class MinistopSchema(ModelSchema) :
    class Meta(ModelSchema.Meta):
        model =  ministop
        sqla_session = db.session
    id = fields.Number(dump_only=True)
    productname = fields.String(required=True)
    price = fields.String(required=True)
    servicename= fields.String(required=True)

    ministop_model =ModelFrame()

    def select_all(self):
        queryset = ministop.query.all()[:10]
        json_productAll = self.ministop_model.Parsing(queryset)
        return json_productAll




