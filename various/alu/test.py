import blueprint_pb2
import unittest
import google.protobuf.json_format
import subprocess
import copy
import time

board_ip = '138.203.76.133'
board_port = '9090'
app_name = 'bp'

def send_request(msg, verbose=False):
    json = google.protobuf.json_format.MessageToJson(msg).replace('\n', '').replace('\r', '')
    msg_name = msg.DESCRIPTOR.full_name
    cmd = ['yproto-send', '-r', board_ip, board_port, app_name, msg_name, json]

    # print(cmd)

    proc = subprocess.Popen(cmd, stdout=subprocess.PIPE)
    response_json = proc.stdout.read()

    # print(response_json)

    resp = google.protobuf.json_format.Parse(response_json, copy.copy(msg))
    return resp

class TestIwfCtx(unittest.TestCase):
    def setUp(self):
        pass

    def tearDown(self):
        pass

    def test_get_line_config_request1(self):
        for i in range(100):
            print i
            time.sleep(3)
            req = blueprint_pb2.Wrapper()
            req.get_line_config_request.board = 0
            req.get_line_config_request.line_ids.extend([1, 2, 3, 4])

            resp = send_request(req)
            self.assertEqual(resp.WhichOneof('msg'), 'get_line_config_response')

if __name__ == '__main__':
    suite = unittest.TestLoader().loadTestsFromTestCase(TestIwfCtx)
    unittest.TextTestRunner(verbosity=2).run(suite)
