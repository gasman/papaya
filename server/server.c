#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <errno.h>

#include <pigpio.h>

#include "ay.h"
#include "command_buffer.h"

#define PORT    8912

static int time_to_next_event;
static unsigned int current_timestamp, last_timestamp;
static int playing = 0;

void update_timer() {
    last_timestamp = current_timestamp;
    current_timestamp = gpioTick();
    time_to_next_event -= (current_timestamp - last_timestamp);
}


void sleep_until_next_event() {
    int busy_time = gpioTick() - current_timestamp;
    int wait_time = time_to_next_event - busy_time;
    if (wait_time > 0) gpioDelay(wait_time);
    update_timer();
}

void handle_command(unsigned char *command, int len) {
    unsigned int ay_freq;

    switch (command[0]) {
        case 'O': /* open */
            ay_freq = (command[2] << 24) | (command[3] << 16) | (command[4] << 8) | command[5];
            if (ay_init(ay_freq) < 0) {
                perror("AY initialisation");
                exit(EXIT_FAILURE);
            }
            current_timestamp = gpioTick();
            time_to_next_event = 0;
            cmdbuffer_clear();
            playing = 1;
            break;
        case 'S': /* stop immediately */
            ay_close();
            playing = 0;
            break;
        case 'R':
        case 'P':
        case 'C':
            cmdbuffer_write(command, len + 2);
            break;
        /* default:
            unknown command - read and discard */
    }
}


int main(int argc, char *argv[]) {
    int sock_fd, client_fd, cli_len, bytes_read, eof, busy, result;
    int enable = 1;
    struct sockaddr_in server_name, client_name;
    unsigned char incoming_command[257];
    unsigned char command_length;

    result = gpioInitialise();
    if (result < 0) {
        return result;
    }

    /* create the socket */
    sock_fd = socket(AF_INET, SOCK_STREAM, 0);
    if (sock_fd < 0) {
        perror("socket");
        exit(EXIT_FAILURE);
    }

    if (setsockopt(sock_fd, SOL_SOCKET, SO_REUSEADDR, &enable, sizeof(int)) < 0) {
        perror("setsockopt");
    }

    /* give the socket a name */
    server_name.sin_family = AF_INET;
    server_name.sin_port = htons(PORT);
    server_name.sin_addr.s_addr = htonl(INADDR_ANY);
    if (bind(sock_fd, (struct sockaddr *) &server_name, sizeof(server_name)) < 0) {
        perror("bind");
        exit(EXIT_FAILURE);
    }

    if (listen(sock_fd,0) < 0) {
        perror("listen");
        exit(EXIT_FAILURE);
    };

    while (1) {
        /* wait for connection */
        cli_len = sizeof(client_name);
        client_fd = accept(sock_fd, (struct sockaddr *) &client_name, &cli_len);
        if (client_fd < 0) {
            perror("accept");
            exit(EXIT_FAILURE);
        }

        /* write handshake message */
        if (send(client_fd, "beep boop\x00\x01", 11, 0) < 0) {
            perror("error writing to socket");
            exit(EXIT_FAILURE);
        }

        cmdbuffer_clear();
        playing = 0;
        eof = 0;

        while (!eof) {

            busy = 1;
            while (busy) {
                /* process outstanding commands from queue */
                while (playing && time_to_next_event <= 0 && !cmdbuffer_is_empty()) {
                    cmdbuffer_run(&time_to_next_event, &playing, client_fd);
                }

                if (cmdbuffer_is_full()) {
                    busy = 0;
                } else {
                    /* poll for new command, or block if queue is empty */
                    bytes_read = recv(
                        client_fd, incoming_command, 2,
                        cmdbuffer_is_empty() ? 0 : MSG_DONTWAIT
                    );
                    if (bytes_read < 0) {
                        if (errno == EWOULDBLOCK || errno == EAGAIN) {
                            busy = 0;
                        } else {
                            /* legitimate read error */
                            perror("recv");
                            exit(EXIT_FAILURE);
                        }
                    } else if (bytes_read < 2) {
                        eof = 1;
                        busy = 0;
                        if (playing) {
                            ay_close();
                            playing = 0;
                        }
                    } else {
                        /* read rest of command */
                        command_length = incoming_command[1];
                        if (command_length > 0) {
                            bytes_read = recv(client_fd, incoming_command + 2, command_length, 0);
                            if (bytes_read < command_length) {
                                eof = 1;
                                busy = 0;
                            } else {
                                handle_command(incoming_command, command_length);
                            }
                        } else {
                            handle_command(incoming_command, command_length);
                        }
                    }
                    if (playing) update_timer();
                }
            }

            if (playing && time_to_next_event > 0 && !eof) {
                sleep_until_next_event();
            }
        }

        if (shutdown(client_fd, SHUT_RDWR) < 0) {
            perror("shutdown");
            exit(EXIT_FAILURE);
        }
    }

    /* 
    close(sock_fd);
    return EXIT_SUCCESS;
    */
}
