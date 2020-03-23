#include <stdio.h>
#include <unistd.h>
#include <signal.h>
#include <string.h>
#include "ay.h"

struct sigaction old_action;

void sigint_handler(int sig_no)
{
    ay_close();
    sigaction(SIGINT, &old_action, NULL);
    kill(0, SIGINT);
}

int main(int argc, char **argv) {
    struct sigaction action;
    FILE *file;
    char signature[4];
    int i, eof, frame_count;
    unsigned char reg, val;

    if (argc != 2) {
        printf("Usage: psg myfile.psg\n");
        return -1;
    }

    file = fopen(argv[1], "rb");
    if (file == NULL) {
        printf("Error opening file\n");
        return -1;
    }
    fread(signature, 4, 1, file);
    if (strncmp(signature, "PSG\x1a", 4) != 0) {
        printf("File is not a valid PSG file\n");
        return -1;
    }

    if (ay_init(SPECTRUM_AY_FREQ) < 0) {
        printf("AY initialisation failed\n");
        return -1;
    }

    memset(&action, 0, sizeof(action));
    action.sa_handler = &sigint_handler;
    sigaction(SIGINT, &action, &old_action);

    /* set initial register values */
    for (i = 0; i < 12; i++) {
        fread(&val, 1, 1, file);
        ay_write(i, val);
    }

    eof = 0;

    while (!eof) {
        while (1) {
            /* read all commands for frame */
            if (!fread(&reg, 1, 1, file) || reg == 0xfd) {
                eof = 1;
                break;
            } else if (reg == 0xff) {
                frame_count = 1;
                break;
            } else if (reg == 0xfe) {
                fread(&val, 1, 1, file);
                frame_count = val * 4;
                break;
            } else {
                fread(&val, 1, 1, file);
                // printf("%i = %i\n", reg, val);
                ay_write(reg, val);
            }
        }
        if (!eof) {
            usleep(frame_count * 20000);
        }
    }

    ay_close();
}
