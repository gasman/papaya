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
    FILE *file1, *file2;
    char signature[4];
    int i, eof1, wait_frames1, eof2, wait_frames2;
    unsigned char reg, val;

    if (argc != 3) {
        printf("Usage: psg2 myfile1.psg myfile2.psg\n");
        return -1;
    }

    file1 = fopen(argv[1], "rb");
    if (file1 == NULL) {
        printf("Error opening file 1\n");
        return -1;
    }
    fread(signature, 4, 1, file1);
    if (strncmp(signature, "PSG\x1a", 4) != 0) {
        printf("File 1 is not a valid PSG file\n");
        return -1;
    }

    file2 = fopen(argv[2], "rb");
    if (file2 == NULL) {
        printf("Error opening file 2\n");
        return -1;
    }
    fread(signature, 4, 1, file2);
    if (strncmp(signature, "PSG\x1a", 4) != 0) {
        printf("File 2 is not a valid PSG file\n");
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
        fread(&val, 1, 1, file1);
        ay_write(i, val);
    }
    for (i = 0; i < 12; i++) {
        fread(&val, 1, 1, file2);
        ay2_write(i, val);
    }

    eof1 = 0;
    wait_frames1 = 0;

    eof2 = 0;
    wait_frames2 = 0;

    while (!eof1 || !eof2 || wait_frames1 || wait_frames2) {
        if (eof1) {
        } else if (wait_frames1) {
            wait_frames1--;
        } else {
            /* read all commands for frame */
            while (1) {
                if (!fread(&reg, 1, 1, file1) || reg == 0xfd) {
                    eof1 = 1;
                    break;
                } else if (reg == 0xff) {
                    break;
                } else if (reg == 0xfe) {
                    fread(&val, 1, 1, file1);
                    wait_frames1 = (val * 4) - 1;
                    break;
                } else {
                    fread(&val, 1, 1, file1);
                    // printf("%i = %i\n", reg, val);
                    ay_write(reg, val);
                }
            }
        }

        if (eof2) {
        } else if (wait_frames2) {
            wait_frames2--;
        } else {
            /* read all commands for frame */
            while (1) {
                if (!fread(&reg, 1, 1, file2) || reg == 0xfd) {
                    eof2 = 1;
                    break;
                } else if (reg == 0xff) {
                    break;
                } else if (reg == 0xfe) {
                    fread(&val, 1, 1, file2);
                    wait_frames2 = (val * 4) - 1;
                    break;
                } else {
                    fread(&val, 1, 1, file2);
                    // printf("%i = %i\n", reg, val);
                    ay2_write(reg, val);
                }
            }
        }

        usleep(20000);
    }

    ay_close();
}
