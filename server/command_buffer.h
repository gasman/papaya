void cmdbuffer_clear();
int cmdbuffer_is_full();
int cmdbuffer_is_empty();
void cmdbuffer_write(unsigned char *src, int len);
unsigned char cmdbuffer_readchar();
unsigned int cmdbuffer_readint();
void cmdbuffer_run(unsigned int *time_to_next_event, int *playing, int client_fd);
