#!/usr/bin/env python

import unittest
import tk_html
import json

OPENWEATHERMAP_BASE_ADDRESS = 'http://api.openweathermap.org/data/2.5/'
OPENWEATHERMAP_API_KEY = '28dda08f5ad68df79d954c876dc6469e'

STUB_DATA_CURRENT = 'tk_weather_test_data_current.json'
STUB_DATA_FORECAST = 'tk_weather_test_data_forecast.json'
STUB = False

def get_file_data(filename):
    with open(filename) as data_file:
        data = json.load(data_file)

    return data

def get_weather_data(city_id, data_type, stub_file):
    global STUB

    data = None
    if STUB:
        data = get_file_data(stub_file)
    else:
        page = OPENWEATHERMAP_BASE_ADDRESS + data_type + '?id=' + city_id + '&appid=' + OPENWEATHERMAP_API_KEY
        data = json.loads(tk_html.get(page))

    #print(data)
    return data

def get_current(city_id):
    return get_weather_data(city_id, 'weather', STUB_DATA_CURRENT)

def get_forecast(city_id):
    return get_weather_data(city_id, 'forecast', STUB_DATA_FORECAST)

class TestTkWeather(unittest.TestCase):
    test_id = '2783737'

    def setUp(self):
        global STUB
        STUB = True

    def test_get_current(self):
        data = get_current(self.test_id)
        self.assertTrue(data)
        self.assertTrue('main' in data)
        self.assertTrue('temp' in data['main'])
        self.assertTrue('pressure' in data['main'])

    def test_get_forecast(self):
        data = get_forecast(self.test_id)
        self.assertTrue(data)

if __name__ == '__main__':
    suite = unittest.TestLoader().loadTestsFromTestCase(TestTkWeather)
    unittest.TextTestRunner(verbosity=2).run(suite)

