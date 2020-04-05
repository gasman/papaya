#!/usr/bin/env python3

import sys
import time

from papaya import Papaya, SPECTRUM_AY_FREQUENCY
from psgfile import PSGFile


if len(sys.argv) != 2:
    print("Usage: psg.py <psgfile>")
    sys.exit()

try:
    psg = PSGFile(sys.argv[1])
except PSGFile.BadPSGFile:
    print("File is not a valid PSG file")
    sys.exit()

ay = Papaya('192.168.1.64')
ay.open(SPECTRUM_AY_FREQUENCY)

for frame in psg.frames():
    if frame:
        ay.write(0, frame)
    ay.pause(20000)
    time.sleep(0.01)

ay.finish()
ay.wait_for_end()
ay.close()
