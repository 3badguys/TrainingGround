#!/usr/bin/python
#-*-coding:utf-8 -*-

import re
import requests
from bs4 import BeautifulSoup
import eventlet
import logging

class domain_to_organizer(object):

    def __init__(self, domain_name):
        self.domain_name = domain_name

    def _generate_url(self, domain_name):
        logging.error("_generate_url not implemented!")
        raise NotImplementedError("_generate_url not implemented!")

    def _get_url_text(self, url):
        try:
            response = requests.get(url)
        except ConnectionError as ex:
            logging.error("_get_url_text failed: {err}".format(err=ex))
            return None

        url_text = response.text
        return url_text

    def _parser_organizer(self, url_text):
        logging.error("_parser_organizer not implemented!")
        raise NotImplementedError("_parser_organizer not implemented!")

    def get_organizer(self):
        url = self._generate_url(self.domain_name)
        url_text = self._get_url_text(url)
        organizer = self._parser_organizer(url_text)
        return organizer

class domain_to_organizer_from_beianbeian(domain_to_organizer):

    def __init__(self, domain_name):
        domain_to_organizer.__init__(self, domain_name)

    def _generate_url(self, domain_name):
        url = 'http://www.beianbeian.com/search/' + domain_name + '.html'
        return url

    def _parser_organizer(self, url_text):
        soup = BeautifulSoup(url_text, 'html.parser')
        res_table = soup.find('table', attrs = {'class': 'layui-table res_table'})
        td_list = res_table.find_all('td')
        organizer = None
        if len(td_list) > 2:
            organizer = td_list[1].text
        return organizer

class domain_to_organizer_from_chinaz(domain_to_organizer):

    def __init__(self, domain_name):
        domain_to_organizer.__init__(self, domain_name)

    def _generate_url(self, domain_name):
        url = 'http://icp.chinaz.com/' + domain_name
        return url

    def _parser_organizer(self, url_text):
        line_list = url_text.splitlines()
        organizer = None
        for line in line_list:
            if re.search(u'主办单位名称', line):
                line = line.strip()
                soup = BeautifulSoup(line, 'html.parser')
                [s.extract() for s in soup('a')]
                if soup.p:
                    organizer = soup.p.text
                break
        return organizer

def single_get_organizer(domain_name):
    d2o_list = [domain_to_organizer_from_beianbeian,
                domain_to_organizer_from_chinaz
    ]
    organizer = None
    for d2o_class in d2o_list:
        d2o = d2o_class(domain_name)
        organizer = d2o.get_organizer()
        if organizer:
            logging.info(u"get organizer succeeded: {domain} ==> {organizer}".format(
                domain=domain_name, organizer=organizer))
            return organizer

    logging.error(u"get organizer failed: domain = {domain}".format(domain=domain_name))
    return organizer

def get_domains_list():
    domains = [
        "www.sina.com",
        "www.baidu.cn",
        "laotie.org",
        "jianrenlei.cn"
    ]

    return domains

def main():
    domains = get_domains_list()

    d2o_map = {}
    pool = eventlet.GreenPool()
    for domain in domains:
        d2o_map[domain] = pool.spawn(single_get_organizer, domain)

    pool.waitall()
    for key, value in d2o_map.iteritems():
        print u"domain to organizer: {domain} ==> {organizer}".format(domain=key, organizer=value.wait())

if __name__ == "__main__":
    logging.basicConfig(format='%(asctime)s - %(pathname)s[line:%(lineno)d] - %(levelname)s: %(message)s',
                        level=logging.DEBUG)
    main()
