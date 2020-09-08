from json import JSONEncoder

from flask import Blueprint
from flask import request
from flask import jsonify

from api.utils.responses import response_with
from api.utils import responses as resp
from api.models.ministop import ministop, MinistopSchema

from api.Frame.REST import RESTAPI
from flask_rest_jsonapi import resource
product_routes = Blueprint("product_routes", __name__)

ministop_frame = RESTAPI("ministop")

@product_routes.route('/ministop',methods=['GET'])
def get_all():
    volist = MinistopSchema().select_all()
    return ministop_frame.get_all("ministopList",volist)







