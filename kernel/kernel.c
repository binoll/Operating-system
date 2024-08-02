void main(void) {
    const char str[] = "Hello my OS!";
    const unsigned int START_POS = 0xB8000;
    const unsigned int SIZE = 4096;

    for (unsigned int i = START_POS; i < START_POS + SIZE; i += 2) {
        char* video_memory = (char*) i;
        *video_memory = ' ';
    }

    for (unsigned int i = START_POS + 1; i < START_POS + SIZE; i += 2) {
        char* video_memory = (char*) i;
        *video_memory = 0xAF;
    }

    for (unsigned int i = 0, j = START_POS; i < sizeof str; ++i, j += 2) {
        char* video_memory = (char*) j;
        *video_memory = str[i];
    }
}
