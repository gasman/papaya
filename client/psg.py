#!/usr/bin/env python3

import sys

from papaya import Papaya
from psgplayer import PSGPlayer

if len(sys.argv) < 2:
    print("Usage: psg.py <psgfile> [psgfile...]")
    sys.exit()

ay = Papaya('192.168.1.64')
player = PSGPlayer(ay, sys.argv[1:])
player.start()
try:
    player.wait()
except KeyboardInterrupt:
    player.stop()
finally:
    ay.close()
