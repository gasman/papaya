all: psg psg2

psg: ay.o psg.o
	gcc -Wall -pthread -o psg psg.o ay.o -lpigpio -lrt

psg2: ay.o psg2.o
	gcc -Wall -pthread -o psg2 psg2.o ay.o -lpigpio -lrt
