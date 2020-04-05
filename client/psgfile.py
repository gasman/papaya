import struct


class PSGFile:
    class BadPSGFile(Exception):
        pass

    def __init__(self, filename):
        with open(filename, mode='rb') as f:
            self.data = f.read()

        header, = struct.unpack_from('4s', self.data, 0)
        if header != b'PSG\x1a':
            raise PSGFile.BadPSGFile("%s: File is not a valid PSG file" % filename)

    def frames(self):
        # Read initial AY values from PSG file
        initial_values, = struct.unpack_from('12s', self.data, 4)
        reg_writes = list(enumerate(initial_values))

        pos = 16
        eof = False
        wait_frames = 0

        while (not eof) or wait_frames:
            if wait_frames:
                wait_frames -= 1
            else:
                # read all commands for frame
                while True:
                    if pos == len(self.data):
                        eof = True
                        break

                    cmd = self.data[pos]
                    pos += 1
                    if cmd == 0xfd:
                        eof = True
                        break
                    elif cmd == 0xff:
                        break
                    elif cmd == 0xfe:
                        wait_frames = (self.data[pos] * 4) - 1
                        pos += 1
                        break
                    else:
                        reg_writes.append((cmd, self.data[pos]))
                        pos += 1

            yield reg_writes
            reg_writes = []