#include <pigpio.h>

static int pins[16] = {17, 27, 22, 10, 9, 11, 5, 6};
static int bc1_1 = 13;
static int bdir_1 = 19;
static int bc1_2 = 20;
static int bdir_2 = 21;

static void setBus(int val) {
    int i;

    for (i=0; i<8; i++) {
        gpioWrite(pins[i], (val >> i) & 1);
    }
}

int ay_init(unsigned int ay_freq) {
    int result;
    int i;

    result = gpioInitialise();
    if (result < 0) {
        return result;
    }

    for (i=0; i<8; i++) {
        gpioSetMode(pins[i], PI_OUTPUT);
    }
    gpioSetMode(bc1_1, PI_OUTPUT);
    gpioSetMode(bdir_1, PI_OUTPUT);
    gpioSetMode(bc1_2, PI_OUTPUT);
    gpioSetMode(bdir_2, PI_OUTPUT);

    gpioHardwareClock(4, ay_freq);

    return 0;
}

void ay_write(int reg, int val) {
    setBus(reg);
    gpioWrite_Bits_0_31_Set((1 << bc1_1) | (1 << bdir_1));
    gpioDelay(10);
    gpioWrite_Bits_0_31_Clear((1 << bc1_1) | (1 << bdir_1));

    setBus(val);
    gpioWrite(bdir_1, 1);
    gpioDelay(10);
    gpioWrite(bdir_1, 0);
}

void ay2_write(int reg, int val) {
    setBus(reg);
    gpioWrite_Bits_0_31_Set((1 << bc1_2) | (1 << bdir_2));
    gpioDelay(10);
    gpioWrite_Bits_0_31_Clear((1 << bc1_2) | (1 << bdir_2));

    setBus(val);
    gpioWrite(bdir_2, 1);
    gpioDelay(10);
    gpioWrite(bdir_2, 0);
}

void ay_silence() {
    int i;
    for (i=0; i < 14; i++) {
        ay_write(i, 0);
    }
}

void ay2_silence() {
    int i;
    for (i=0; i < 14; i++) {
        ay2_write(i, 0);
    }
}

void ay_close() {
    ay_silence();
    ay2_silence();
    gpioHardwareClock(4, 0);
    gpioTerminate();
}
