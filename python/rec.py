#!/usr/bin/env python3

import argparse
import tk_sound
import tempfile

def int_or_str(text):
    try:
        return int(text)
    except ValueError:
        return text

if __name__ == '__main__':
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('-l', '--list-devices', action='store_true', help='show list of audio devices')
    p.add_argument('-d', '--device', type=int_or_str, help='input device (id or substring)')
    p.add_argument('-r', '--samplerate', type=int, help='sampling rate')
    p.add_argument('-c', '--channels', type=int, help='number of channels')
    p.add_argument('filename', nargs='?', metavar='FILENAME', help='output record file')
    args = p.parse_args()

    if args.list_devices:
        tk_sound.list_devices()
        p.exit(0)

    if args.samplerate is None:
        dev = tk_sound.get_device(args.device)
        args.samplerate = int(dev['default_samplerate'])

    if args.filename is None:
        args.filename = tempfile.mktemp(prefix='rec_', suffix='.wav', dir='')

    try:
        tk_sound.record_to_file(args.filename, args.device, samplerate=args.samplerate, channels=args.channels)
    except Exception as e:
        p.exit(type(e).__name__ + ': ' + str(e))

    p.exit(0)

