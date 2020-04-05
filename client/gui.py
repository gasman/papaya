#!/usr/bin/env python3

from functools import partial
import os.path
import tkinter as tk

from papaya import Papaya
from psgplayer import PSGPlayer

TRACKS_ROOT = '/home/pi/dev/papaya/tracks/'

SONGS = [
    {'title': "Aerodynamic", 'files': ['aerodynamic.psg']},
    {'title': "Candy", 'files': ['candy.psg']},
    {'title': "CybRevenge", 'files': ['cybernoids_revenge.psg']},
    {'title': "Dancing Queen", 'files': ['dancing_queen.psg']},
    {'title': "Danger Zone", 'files': ['dangerzone.psg'], 'frame_rate': 10_000},
    {'title': "Doctor Who", 'files': ['doctor_who.psg']},
    {'title': "Dynamite", 'files': ['dynamite1.psg', 'dynamite2.psg']},
    {'title': "Enigma", 'files': ['enigma.psg']},
    {'title': "Hung Up", 'files': ['hung_up_1.psg', 'hung_up_2.psg']},
    {'title': "In The Future", 'files': ['inthefuture.psg']},
    {'title': "Let It Go", 'files': ['let_it_go.psg']},
    {'title': "Masterplan", 'files': ['masterplan_envfix.psg']},
    {'title': "Neverland", 'files': ['neverland_eindbaas.psg']},
    {'title': "OldskoolCrusader", 'files': ['oldskool_crusader.psg']},
    {'title': "Panic Room", 'files': ['panicroom.psg']},
    {'title': "Pa-pa-pa", 'files': ['papapa.psg']},
    {'title': "Rainbow Dash", 'files': ['rainbow_dash.psg']},
    {'title': "Rainbow2Eternity", 'files': ['rainbow_to_eternity.psg']},
    {'title': "Rob Is Jarig", 'files': ['rob_is_jarig.psg']},
    {'title': "Run With Us", 'files': ['runwithus.psg'], 'frame_rate': 10_000},
    {'title': "Sailor Moon", 'files': ['sailor1.psg', 'sailor2.psg']},
    {'title': "Sandstorm", 'files': ['sandstorm.psg']},
    {'title': "Spacecake", 'files': ['spacecake.psg']},
    {'title': "Star Wars", 'files': ['starwars.psg']},
    {'title': "Swung Up", 'files': ['swungup.psg']},
    {'title': "Thriller", 'files': ['thriller.psg']},
    {'title': "Titanic", 'files': ['titanic.psg']},
    {'title': "Torch Dragon", 'files': ['torch_dragon.psg']},
    {'title': "Trixie2", 'files': ['trixie2.psg']},
    {'title': "VideoKilledThe", 'files': ['vktrs.psg']},
    {'title': "Wonderful World", 'files': ['wonderful_world.psg']},
    {'title': "X-RaySpeculation", 'files': ['xray1.psg', 'xray2.psg']},
]


class App:
    def quit_on_escape(self, event):
        if self.player:
            self.player.stop()
        self.master.quit()

    def quit_on_button(self):
        if self.player:
            self.player.stop()
        self.master.quit()

    def stop(self):
        if self.player:
            self.player.stop()

    def play(self, song):
        if self.player:
            self.player.stop()

        paths = [os.path.join(TRACKS_ROOT, filename) for filename in song['files']]
        player_opts = {}
        if 'frame_rate' in song:
            player_opts['frame_rate'] = song['frame_rate']

        self.player = PSGPlayer(self.ay, paths, **player_opts)
        self.player.start()

    def __init__(self, master):
        #frame = tk.Frame(master)

        self.master = master

        master.attributes('-fullscreen', True)
        master.configure(bg='black')
        master.bind("<Escape>", self.quit_on_escape)

        options = tk.Frame(master)
        options.configure(bg='black')
        options.pack(side=tk.BOTTOM)

        self.ay = Papaya('127.0.0.1')
        self.player = None

        self.stop_button = tk.Button(
            options, text="STOP", command=self.stop
        )
        self.stop_button.grid(row=0, column=0, padx=30)
        self.quit_button = tk.Button(
            options, text="QUIT", fg="red", command=self.quit_on_button
            )
        self.quit_button.grid(row=0, column=1, padx=30)

        track_listing = tk.Frame(master)
        track_listing.configure(bg='black')
        track_listing.pack(side=tk.LEFT)
        for i, song in enumerate(SONGS):
            song_button = tk.Button(
                track_listing, text=song['title'], command=partial(self.play, song)
            )
            song_button.grid(row=i % 8, column=int(i / 8), padx=10, pady=10)


root = tk.Tk()
app = App(root)

root.mainloop()
root.destroy()