#include <stdio.h>
extern void hello_from_asm(const unsigned char* str, const unsigned char* str2);

int main() {
	printf("Hello from C\n");
	hello_from_asm("Hello from ASM1\n", "Hello from ASM2\n");
	getchar();
	return 0;
}
