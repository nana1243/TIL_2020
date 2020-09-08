import json
from test02.api.utils.test_base import BaseTestCase
from test02.api.models.authors import Author
from test02.api.models.books import Book
from datetime import datetime
import unittest2 as unittest
import io


def create_authors():
    author1 = Author(first_name="HENNIE", last_name="CHOI").create()
    Book(title="Test Book 1", year=str(datetime(1976, 1, 1)), author_id=author1.id).create()
    Book(title="Test Book 2", year=str(datetime(1992, 12, 1)), author_id=author1.id).create()


class TestAuthors(BaseTestCase):
    def setUp(self):
        super(TestAuthors, self).setUp()
        create_authors()

    def test_create_author(self):
        author = {
            'first_name': 'HENNIES',
            'last_name': 'CHOIS'
        }

        response = self.app.post(
            '/api/authors/',
            data=json.dumps(author),
            content_type='application/json',
            headers={'Authorization': 'Bearer' }
        )
        data = json.loads(response.data)
        self.assertEqual(201, response.status_code)
        self.assertTrue('author' in data)




if __name__ == '__main__':
    unittest.main()