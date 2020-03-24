all: server

server: ay.o server.o command_buffer.o
	gcc -Wall -pthread -o server server.o ay.o command_buffer.o -lpigpio -lrt
