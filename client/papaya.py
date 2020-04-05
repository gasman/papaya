import socket
import struct

BUFFER_SIZE = 1024
SPECTRUM_AY_FREQUENCY = 1773400

def build_packet(id, data):
    fmt = 'cB{}s'.format(len(data))
    return struct.pack(fmt, id, len(data), data)


class Papaya:
    def __init__(self, hostname, port=8912):
        self.socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.socket.setsockopt(socket.IPPROTO_TCP, socket.TCP_NODELAY, True)

        self.socket.connect((hostname, port))
        data = self.socket.recv(BUFFER_SIZE)
        if data[:10] != b'beep boop\0':
            raise Exception('Unexpected connection message: %r' % data)

        self.chip_count = data[10]

    def open(self, ay_freq):
        open_msg = build_packet(b'O', struct.pack('!II', ay_freq, 0))
        self.socket.sendall(open_msg)

    def write(self, chip, registers):
        reg_data = []
        for reg, val in registers:
            reg_data.append(reg)
            reg_data.append(val)

        fmt = 'B{}B'.format(len(reg_data))
        reg_msg = build_packet(b'R', struct.pack(fmt, chip, *reg_data))
        self.socket.sendall(reg_msg)

    def pause(self, usec):
        pause_msg = build_packet(b'P', struct.pack('!I', usec))
        self.socket.sendall(pause_msg)

    def finish(self):
        close_msg = build_packet(b'C', b'')
        self.socket.sendall(close_msg)

    def wait_for_end(self):
        while True:
            data = self.socket.recv(2)
            if len(data) == 0:
                continue

            # read rest of packet, if length > 0
            data_len = data[1]
            if data_len > 0:
                self.socket.recv(data_len)

            if data[0:1] == b'c':
                break

    def close(self):
        self.socket.close()
