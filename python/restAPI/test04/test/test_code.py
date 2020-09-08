import unittest
from forunittest.backend import  multiply
import requests


class UnitTest(unittest.TestCase):

    def test_wrong(self):
        self.assertEqual(10, multiply(10, 3))

    def test_right(self):
        self.assertEqual(18, multiply(3, 6))


if __name__ == '__main__':
    unittest.main()