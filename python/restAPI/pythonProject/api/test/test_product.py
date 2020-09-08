import tempfile
import unittest

# from api.routes.product import product_routes
import resp
from sqlalchemy.testing import db

from api.config.config import TestingConfig
from api.models.ministop import ministop
from api.routes.product import product_routes
from api.utils import test_base
from api.utils.responses import response_with
from main import create_app


class test_product:
    def setUp(self):
        app = create_app(TestingConfig)
        self.test_db_file = tempfile.mkstemp()[1]
        self.app = app.test_client()


    @product_routes.route('/ministop', methods=['GET'])
    def get_book_list(self):
        ans = []
        fetched = ministop.query.all()[:1]
        print(fetched[0].productname)
        return response_with(resp.SUCCESS_200, value={"ministop": ans})

    def tearDown(self):
        db.session.close_all()
        db.drop_all()




test_product()
if __name__ == '__main__':
    unittest.main()





