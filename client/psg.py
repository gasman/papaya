#!/usr/bin/env python3

from itertools import zip_longest
import sys
import time

from papaya import Papaya, SPECTRUM_AY_FREQUENCY
from psgfile import PSGFile


if len(sys.argv) < 2:
    print("Usage: psg.py <psgfile> [psgfile...]")
    sys.exit()

psg_files = []
for filename in sys.argv[1:]:
    try:
        psg_files.append(PSGFile(filename))
    except PSGFile.BadPSGFile:
        print("%s: File is not a valid PSG file" % filename)
        sys.exit()

ay = Papaya('192.168.1.64')
ay.open(SPECTRUM_AY_FREQUENCY)

if ay.chip_count < len(psg_files):
    print("warning: trying to play %d files but only %d chips available" % (len(psg_files), ay.chip_count))

for frame in zip_longest(*(psg.frames() for psg in psg_files), fillvalue=[]):
    for chip_num, regs in enumerate(frame):
        if regs:
            ay.write(chip_num, regs)
    ay.pause(20000)
    time.sleep(0.01)

ay.finish()
ay.wait_for_end()
ay.close()
