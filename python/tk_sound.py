#!/usr/bin/env python

import sounddevice
import soundfile
import unittest
import time
import Queue
import threading

DEFAULT_SAMPLERATE=48000
DEFAULT_CHANNELS=2

def list_devices():
    print(sounddevice.query_devices())

def get_device(device, device_type='input'):
    return sounddevice.query_devices(device, device_type)

def record(device, duration, samplerate=DEFAULT_SAMPLERATE, channels=DEFAULT_CHANNELS, blocking=True):
    r = sounddevice.rec(int(duration * samplerate), samplerate=samplerate, channels=channels, blocking=blocking)
    return r

def record_to_queue(device, samplerate=DEFAULT_SAMPLERATE, channels=DEFAULT_CHANNELS, duration=-1, blocking=True):
    max_frames = 0
    if duration != -1:
        max_frames = int(duration * samplerate)

    q = Queue.Queue()
    stream = None
    try:
        # needs to be a mutable value to be accessible by the closure
        read_frames = [0]

        def _on_data(indata, frames, time, status):
            if status:
                print(status)

            q.put(indata.copy())
            read_frames[0] += frames

        stream = sounddevice.InputStream(samplerate=samplerate, device=device, channels=channels, callback=_on_data)
        stream.start()

        if blocking:
            while True:
                if max_frames and (read_frames[0] > max_frames):
                    print('finished recording')
                    stream.stop()
                    stream.close()
                    break

    except KeyboardInterrupt:
        print('finished recording')

    return q, stream

def record_queue_to_file(outfilename, q, samplerate=DEFAULT_SAMPLERATE, channels=DEFAULT_CHANNELS):
    try:
        with soundfile.SoundFile(outfilename, mode='x', samplerate=samplerate, channels=channels) as f:
            f.write(q.get_nowait())
    except Queue.Empty:
        pass

    return repr(outfilename)

def record_to_file(outfilename, device, samplerate=DEFAULT_SAMPLERATE, channels=DEFAULT_CHANNELS, duration=-1):
    q, _ = record_to_queue(device, samplerate, channels, duration)

    return record_queue_to_file(outfilename, q, samplerate=samplerate, channels=channels)

import tempfile

class TestTkSound(unittest.TestCase):
    def test_record_to_file_1s(self):
        f = record_to_file(tempfile.mktemp(prefix='rec_', suffix='.wav', dir=''), sounddevice.default.device, duration=1)
        print(f)

    def test_record_stereo_1s(self):
        samples = record(sounddevice.default.device, 1, channels=2)
        print(samples)

    def test_record_mono_1s(self):
        samples = record(sounddevice.default.device, 1, channels=1)
        print(samples)

    def test_list_devices(self):
        list_devices()

    def test_async_record_stereo_1s(self):
        samplerate = DEFAULT_SAMPLERATE
        q, s = record_to_queue(sounddevice.default.device, samplerate=samplerate, blocking=False)

        for i in range(0, 20):
            time.sleep(.1)

        s.stop()
        s.close()

        try:
            while True:
                samples = q.get_nowait()
                print(samples)
        except Queue.Empty:
            pass

if __name__ == '__main__':
    suite = unittest.TestLoader().loadTestsFromTestCase(TestTkSound)
    unittest.TextTestRunner(verbosity=2).run(suite)

