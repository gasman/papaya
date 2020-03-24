#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>

#include "ay.h"
#include "command_buffer.h"

#define CMDBUFFER_SIZE 65536

static unsigned char command_buffer[CMDBUFFER_SIZE];
static int read_index, write_index;

void cmdbuffer_clear() {
    read_index = write_index = 0;
}

int cmdbuffer_is_full() {
    return (write_index - read_index + CMDBUFFER_SIZE) % CMDBUFFER_SIZE > (CMDBUFFER_SIZE - 512);
}

int cmdbuffer_is_empty() {
    return read_index == write_index;
}

void cmdbuffer_write(unsigned char *src, int len) {
    while (len > 0) {
        command_buffer[write_index] = *src;
        src++;
        write_index = (write_index + 1) % CMDBUFFER_SIZE;
        len--;
    }
}

unsigned char cmdbuffer_readchar() {
    unsigned int result = command_buffer[read_index];
    read_index = (read_index + 1) % CMDBUFFER_SIZE;
    return result;
}

unsigned int cmdbuffer_readint() {
    return (cmdbuffer_readchar() << 24) | (cmdbuffer_readchar() << 16) | (cmdbuffer_readchar() << 8) | cmdbuffer_readchar();
}

void cmdbuffer_run(unsigned int *time_to_next_event, int *playing, int client_fd) {
    unsigned char command = cmdbuffer_readchar();
    unsigned char len = cmdbuffer_readchar();

    if (command == 'P') {
        *time_to_next_event += cmdbuffer_readint();
        read_index = (read_index + len - 4) % CMDBUFFER_SIZE;
    } else if (command == 'R') {
        unsigned char chip_number = cmdbuffer_readchar();
        len--;
        if (chip_number == 0) {
            while (len) {
                int reg = cmdbuffer_readchar();
                int val = cmdbuffer_readchar();
                ay_write(reg, val);
                /* printf("%i = %i\n", reg, val); */
                len -= 2;
            }
        } else {
            while (len) {
                ay2_write(cmdbuffer_readchar(), cmdbuffer_readchar());
                len -= 2;
            }
        }
    } else if (command == 'C') {
        ay_close();
        *playing = 0;
        cmdbuffer_clear();
        send(client_fd, "c\x00", 2, 0);
    } else {
        read_index = (read_index + len) % CMDBUFFER_SIZE;
    }
}