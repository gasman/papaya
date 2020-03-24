int ay_init(unsigned int ay_freq);
void ay_write(int reg, int val);
void ay2_write(int reg, int val);
void ay_silence();
void ay2_silence();
void ay_close();

#define SPECTRUM_AY_FREQ 1773400
