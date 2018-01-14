# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import unittest
from django.test import TestCase, Client

class SimpleTest(unittest.TestCase):
    def setUp(self):
        # Every test needs a client.
        self.client = Client()

    def test_details(self):
        # Issue a GET request.
        response = self.client.get('/recvotes/2/')

        # Check that the response is 200 OK.
        self.assertEqual(response.status_code, 200)

        # Check that the response is not 404.
        self.assertNotEqual(response.status_code, 404)


