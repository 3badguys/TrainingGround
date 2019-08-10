#!/usr/bin/python
# -*- coding: utf-8 -*-

import unittest
from domain_query import *
import mock

class CCHTestFunc(unittest.TestCase):

    @mock.patch("domain_query.domain_to_organizer_from_beianbeian.get_organizer")
    def test_get_organizer_from_beianbeian(self, mock_get_organizer):
        mock_get_organizer.return_value = u"上海语程信息科技有限公司"
        d2o = domain_to_organizer_from_beianbeian("www.cnblogs.com")
        organizer = d2o.get_organizer()
        self.assertEqual(u"上海语程信息科技有限公司", organizer)

    @mock.patch("domain_query.domain_to_organizer_from_chinaz.get_organizer")
    def test_get_organizer_from_chinaz(self, mock_get_organizer):
        mock_get_organizer.return_value = u"上海语程信息科技有限公司"
        d2o = domain_to_organizer_from_chinaz("www.cnblogs.com")
        organizer = d2o.get_organizer()
        self.assertEqual(u"上海语程信息科技有限公司", organizer)

    @mock.patch("domain_query.domain_to_organizer_from_beianbeian.get_organizer")
    @mock.patch("domain_query.domain_to_organizer_from_chinaz.get_organizer")
    def test_single_get_organizer_1(self, mock_get_organizer_1, mock_get_organizer_2):
        mock_get_organizer_1.return_value = u"上海语程信息科技有限公司"
        mock_get_organizer_2.return_value = u"上海语程信息科技有限公司"
        organizer = single_get_organizer("www.cnblogs.com")
        self.assertEqual(u"上海语程信息科技有限公司", organizer)

    @mock.patch("domain_query.domain_to_organizer_from_beianbeian.get_organizer")
    @mock.patch("domain_query.domain_to_organizer_from_chinaz.get_organizer")
    def test_single_get_organizer_2(self, mock_get_organizer_1, mock_get_organizer_2):
        mock_get_organizer_1.return_value = u"上海语程信息科技有限公司"
        mock_get_organizer_2.return_value = None
        organizer = single_get_organizer("www.cnblogs.com")
        self.assertEqual(u"上海语程信息科技有限公司", organizer)

    @mock.patch("domain_query.domain_to_organizer_from_beianbeian.get_organizer")
    @mock.patch("domain_query.domain_to_organizer_from_chinaz.get_organizer")
    def test_single_get_organizer_3(self, mock_get_organizer_1, mock_get_organizer_2):
        mock_get_organizer_1.return_value = None
        mock_get_organizer_2.return_value = u"上海语程信息科技有限公司"
        organizer = single_get_organizer("www.cnblogs.com")
        self.assertEqual(u"上海语程信息科技有限公司", organizer)

    @mock.patch("domain_query.domain_to_organizer_from_beianbeian.get_organizer")
    @mock.patch("domain_query.domain_to_organizer_from_chinaz.get_organizer")
    def test_single_get_organizer_4(self, mock_get_organizer_1, mock_get_organizer_2):
        mock_get_organizer_1.return_value = None
        mock_get_organizer_2.return_value = None
        organizer = single_get_organizer("www.cnblogs.com")
        self.assertEqual(None, organizer)

    def test_get_domains_list(self):
        domains = get_domains_list()
        self.assertEqual([
            "www.sina.com",
            "www.baidu.cn",
            "laotie.org",
            "jianrenlei.cn"
        ], domains)

if __name__ == "__main__":
    suite = unittest.TestSuite()
    suite.addTest(CCHTestFunc('test_get_organizer_from_beianbeian'))
    suite.addTest(CCHTestFunc('test_get_organizer_from_chinaz'))
    suite.addTest(CCHTestFunc('test_single_get_organizer_1'))
    suite.addTest(CCHTestFunc('test_single_get_organizer_2'))
    suite.addTest(CCHTestFunc('test_single_get_organizer_3'))
    suite.addTest(CCHTestFunc('test_single_get_organizer_4'))
    suite.addTest(CCHTestFunc('test_get_domains_list'))
    unittest.TextTestRunner().run(suite)
