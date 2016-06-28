unsigned char port_byte_in(unsigned short port) {
    // Reads a byte from specified port using inline ASM
    unsigned char result;
    __asm__("in %%dx, %%al" : "=a" (result) : "d" (port));
    return result;
}

void port_byte_out(unsigned short port, unsigned char data) {
    // Writes byte data to port using inline ASM
    __asm__("out %%al, %%dx" : :"a" (data), "d" (port));
}

unsigned short port_word_in(unsigned short port) {
    unsigned short result;
    __asm__("in %%dx, %%ax" : "=a" (result) : "d" (port));
    return result;
}

void port_word_out(unsigned short port, unsigned short data) {
    // Writes byte data to port using inline ASM
    __asm__("out %%ax, %%dx" : :"a" (data), "d" (port));
}

