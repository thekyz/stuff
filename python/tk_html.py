#!/usr/bin/env python

import urllib2
import bs4
import unittest
import tk_cache

def get(page, cache=True):
    if cache:
        response = urllib2.build_opener(tk_cache.CacheHandler('/tmp/')).open(page)
    else:
        response = urllib2.urlopen(page)
    return response.read()

def get_soup(page, fix_a_tags=False):
    html = get(page)

    proper_html = html
    if fix_a_tags:
        proper_html = ''
        for line in html.split():
            line = line.replace('"/>', '">')
            proper_html = proper_html + '\n' + line

    soup = bs4.BeautifulSoup(proper_html, 'html.parser')

    return soup

class TestTkHtml(unittest.TestCase):
    def test_get(self):
        html = get('http://www.perdu.com')
        self.assertTrue(html)
        self.assertTrue('Vous Etes Perdu ?' in html)

    def test_get_soup(self):
        soup = get_soup('http://www.perdu.com')
        self.assertTrue(soup)
        self.assertEquals(soup.title.string, 'Vous Etes Perdu ?')


if __name__ == '__main__':
    suite = unittest.TestLoader().loadTestsFromTestCase(TestTkHtml)
    unittest.TextTestRunner(verbosity=2).run(suite)
