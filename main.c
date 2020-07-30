#include <stdio.h>

extern void hello_from_asm(const unsigned char* str, const unsigned char* str2);
extern unsigned int ReadCpuBrandStr(unsigned char* str);

int main() {
    unsigned int a=0;
    char cpuBstr[16*3];
	printf("Hello from C\n");
	hello_from_asm("Hello from ASM1\n", "Hello from ASM2\n");
	ReadCpuBrandStr(cpuBstr);
	printf("CPU Brand String: %s\n",cpuBstr);
	getchar();
	return 0;
}
