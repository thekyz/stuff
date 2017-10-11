#!/usr/bin/env python

import sounddevice
import soundfile
import unittest
import queue

DEFAULT_SAMPLERATE=48000
DEFAULT_CHANNELS=2

def list_devices():
    print(sounddevice.query_devices())

def get_device(device, device_type='input'):
    return sounddevice.query_devices(device, device_type)

def record(duration, samplerate=DEFAULT_SAMPLERATE, channels=DEFAULT_CHANNELS, blocking=True):
    r = sounddevice.rec(int(duration * samplerate), samplerate=samplerate, channels=channels, blocking=blocking)
    return r

def record_to_file(outfilename, device, samplerate=DEFAULT_SAMPLERATE, channels=DEFAULT_CHANNELS, duration=-1):
    max_frames = 0
    if duration != -1:
        max_frames = int(duration * samplerate)

    try:
        q = queue.Queue()
        # needs to be a mutable value to be accessible by the closure
        read_frames = [0]

        def _on_data(indata, frames, time, status):
            if status:
                print(status)

            q.put(indata.copy())
            read_frames[0] += frames

        with soundfile.SoundFile(outfilename, mode='x', samplerate=samplerate, channels=channels) as f:
            with sounddevice.InputStream(samplerate=samplerate, device=device, channels=channels, callback=_on_data):
                print('...')
                while True:
                    f.write(q.get())
                    if max_frames and (read_frames[0] > max_frames):
                        print('finished recording ' + repr(outfilename))
                        break

    except KeyboardInterrupt:
        print('finished recording ' + repr(outfilename))
        return 0

import tempfile

class TestTkSound(unittest.TestCase):
    def test_record_to_file_1s(self):
        record_to_file(tempfile.mktemp(prefix='rec_', suffix='.wav', dir=''), sounddevice.default.device, duration=1)

    def test_record_stereo_1s(self):
        samples = record(1, channels=2)

    def test_record_mono_1s(self):
        samples = record(1, channels=1)

    def test_list_devices(self):
        list_devices()

if __name__ == '__main__':
    suite = unittest.TestLoader().loadTestsFromTestCase(TestTkSound)
    unittest.TextTestRunner(verbosity=2).run(suite)

