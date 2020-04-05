#!/usr/bin/env python3

import socket
import struct
import sys
import time

BUFFER_SIZE = 1024
AY_FREQ = 1773400

def build_packet(id, data):
    fmt = 'cB{}s'.format(len(data))
    return struct.pack(fmt, id, len(data), data)

if len(sys.argv) != 2:
    print("Usage: psg.py <psgfile>")
    sys.exit()

with open(sys.argv[1], mode='rb') as f:
    psg_data = f.read()

header, = struct.unpack_from('4s', psg_data, 0)
if header != b'PSG\x1a':
    print("File is not a valid PSG file")
    sys.exit()

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.setsockopt(socket.IPPROTO_TCP, socket.TCP_NODELAY, True)

s.connect(('192.168.1.64', 8912))
data = s.recv(BUFFER_SIZE)
if data[:10] != b'beep boop\0':
    raise Exception('Unexpected connection message: %r' % data)
chip_count = data[10]

open_msg = build_packet(b'O', struct.pack('!II', AY_FREQ, 0))

# Read initial AY values from PSG file
initial_values, = struct.unpack_from('12s', psg_data, 4)
initial_reg_msg_data = []
for reg, val in enumerate(initial_values):
    initial_reg_msg_data.append(reg)
    initial_reg_msg_data.append(val)

reg_msg = build_packet(b'R', struct.pack('25B', 0, *initial_reg_msg_data))
s.sendall(open_msg + reg_msg)

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
                reg_writes1.append(cmd)
                reg_writes1.append(psg_data[pos1])
                pos1 += 1

    if reg_writes1:
        fmt = 'B{}B'.format(len(reg_writes1))
        reg_msg1 = build_packet(b'R', struct.pack(fmt, 0, *reg_writes1))
    else:
        reg_msg1 = b''

    pause_msg = build_packet(b'P', struct.pack('!I', 20000))
    s.sendall(reg_msg1 + pause_msg)
    time.sleep(0.01)

close_msg = build_packet(b'C', b'')
s.sendall(close_msg)

while True:
    data = s.recv(2)
    if len(data) == 0:
        continue

    # read rest of packet, if length > 0
    data_len = data[1]
    if data_len > 0:
        s.recv(data_len)

    if data[0:1] == b'c':
        break

s.close()
