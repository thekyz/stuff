#!/usr/bin/env python

import argparse
import tk_html

TIERLIST_PAGE = 'http://www.heartharena.com/tierlist'
TIERLIST_CACHE = '/tmp/tk_hatl.cache'

def get_tier_value(cardname, class_):
    soup = tk_html.get_soup(TIERLIST_PAGE)

    table = soup.find('section', class_=class_).find('ul')

    for card_soup in table.find_all('dt'):
        if not card_soup.string:
            continue

        ha_cardname = card_soup.string.strip().lower()

        if not ha_cardname:
            continue

        #print(ha_cardname)
        if cardname.strip().lower() in ha_cardname:
            return card_soup.string.strip(), card_soup.parent.find('dd').string

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-H', '--hero', action='store')
    parser.add_argument('-c', '--card', action='store')
    args = parser.parse_args()

    tv = get_tier_value(args.card, args.hero)

    print(tv)
