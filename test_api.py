import unittest

from fastapi.testclient import TestClient

from main import app


class ApiTestCase(unittest.TestCase):
    def setUp(self):
        self.client = TestClient(app)

    def test_read_root(self):
        response = self.client.get("/")
        assert response.status_code == 200
        assert response.json() == {"message": "Hello, AWS CI/CD BEANSTALK!"}
