from itertools import zip_longest
import threading
import time

from psgfile import PSGFile
from papaya import SPECTRUM_AY_FREQUENCY

# number of seconds of extra data to send ahead of current actual play time
LATENCY = 1

def player_thread(ay, psg_files, frame_rate, status):
    ay.open(SPECTRUM_AY_FREQUENCY)
    start_time = time.time()

    status['playing'] = True

    for frame_num, frame in enumerate(
        zip_longest(*(psg.frames() for psg in psg_files), fillvalue=[])
    ):
        if status['stopped']:
            status['playing'] = False
            ay.stop()
            break

        for chip_num, regs in enumerate(frame):
            if regs:
                ay.write(chip_num, regs)
        ay.pause(frame_rate)
        queued_time = frame_rate / 1_000_000 * frame_num
        played_time = time.time() - start_time
        backlog = queued_time - played_time
        if backlog > LATENCY:
            time.sleep(backlog - LATENCY)

    if not status['stopped']:
        ay.finish()
        ay.wait_for_end()
    status['playing'] = False


class PSGPlayer:
    def __init__(self, ay, files, frame_rate=20000):
        self.ay = ay
        self.psg_files = []
        for filename in files:
            self.psg_files.append(PSGFile(filename))

        self.frame_rate = frame_rate

        if ay.chip_count < len(self.psg_files):
            print("warning: trying to play %d files but only %d chips available" % (len(self.psg_files), ay.chip_count))

        self.status = {
            'playing': False,
            'stopped': False,
        }

        self.thread = None

    def start(self):
        self.thread = threading.Thread(target=player_thread, args=(self.ay, self.psg_files, self.frame_rate, self.status))
        self.thread.start()

    def stop(self):
        self.status['stopped'] = True
        self.thread.join()

    def wait(self):
        self.thread.join()
