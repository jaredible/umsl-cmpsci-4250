// Title	:main
// Description	:A C program that examines activation records in the runtime stack.
// Author	:Jared Diehl
// Date		:20191113
// Version	:1.0
// Usage	:./main
// Notes	:CMPSCI2450 Project5

#include <stdio.h>
#include <stdlib.h>

#define SIZE 1000

void f1()
{
	char arr[SIZE];
	static int n = 1;
	static long int addr;
	
	printf("Call #%d\t at %p\n", n, arr);
	printf("AR size #%d\t is %ld\n", n, addr - (long)arr);
	
	n++;
	
	addr = (long)arr;
	
	if (n <= 10)
	{
		f1();
	}
	else
	{
		return;
	}
}

void f2()
{
	char arr[SIZE];
	static int n = 1;
	static long int addr;
	
	printf("Call #%d\t at %p\n", n, arr);
	printf("AR size #%d\t is %ld\n", n, addr - (long)arr);
	printf("Stack Size\t#%d is %ld\n", n, n * addr);
	
	n++;
	
	addr = (long)arr;
	
	f2();
}

void f3()
{
	char *arr = (char*)malloc(sizeof(char) * SIZE);
	static int n = 1;
	static long int addr;
	
	printf("Call #%d\t at %p\n", n, arr);
	printf("AR size #%d\t is %ld\n", n, addr - (long)arr);
	
	n++;
	
	addr = (long)arr;
	
	free(arr);
	
	if (n <= 10)
	{
		f3();
	}
	else
	{
		return;
	}
}

int main()
{
	//f1();
	//f2();
	f3();
	return 0;
}
