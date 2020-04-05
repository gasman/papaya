#!/usr/bin/env python3

import socket
import struct
import sys
import time

from papaya import Papaya, SPECTRUM_AY_FREQUENCY


if len(sys.argv) != 2:
    print("Usage: psg.py <psgfile>")
    sys.exit()

with open(sys.argv[1], mode='rb') as f:
    psg_data = f.read()

header, = struct.unpack_from('4s', psg_data, 0)
if header != b'PSG\x1a':
    print("File is not a valid PSG file")
    sys.exit()

ay = Papaya('192.168.1.64')
ay.open(SPECTRUM_AY_FREQUENCY)

# Read initial AY values from PSG file
initial_values, = struct.unpack_from('12s', psg_data, 4)
ay.write(0, enumerate(initial_values))

pos1 = 16
eof1 = False
wait_frames1 = 0

while (not eof1) or wait_frames1:
    reg_writes1 = []
    if eof1:
        pass
    elif wait_frames1:
        wait_frames1 -= 1
    else:
        # read all commands for frame
        while True:
            if pos1 == len(psg_data):
                eof1 = True
                break

            cmd = psg_data[pos1]
            pos1 += 1
            if cmd == 0xfd:
                eof1 = True
                break
            elif cmd == 0xff:
                break
            elif cmd == 0xfe:
                wait_frames1 = (psg_data[pos1] * 4) - 1
                pos1 += 1
                break
            else:
                reg_writes1.append((cmd, psg_data[pos1]))
                pos1 += 1

    if reg_writes1:
        ay.write(0, reg_writes1)

    ay.pause(20000)
    time.sleep(0.01)

ay.finish()
ay.wait_for_end()
ay.close()
