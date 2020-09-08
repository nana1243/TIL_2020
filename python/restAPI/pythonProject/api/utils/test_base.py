import unittest2 as unittest
from flask import Blueprint

from api.utils.database import db
from api.config.config import TestingConfig
import tempfile
from main import create_app


class BaseTestCase(unittest.TestCase):
    def setUp(self):
        app = create_app(TestingConfig)
        self.test_db_file = tempfile.mkstemp()[1]
        self.app = app.test_client()


    def setupEndpoint(self):
        product_routes = Blueprint("product_routes", __name__)
        return  product_routes


    def tearDown(self):
        db.session.close_all()
        db.drop_all()

