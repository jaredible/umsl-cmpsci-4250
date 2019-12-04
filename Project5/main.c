// Title	:main
// Description	:A C program that examines activation records in the runtime stack.
// Author	:Jared Diehl
// Date		:20191113
// Version	:1.0
// Usage	:./main
// Notes	:CMPSCI2450 Project5

#include <stdio.h>
#include <stdlib.h>

#define SIZE 10

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
	char c;
	
	printf("%ld\n", sizeof(char));
	//printf("arr address: %ld\n", (long)&arr);
	//printf("c address  : %ld\n", (long)&c);
	
	printf("%ld\n", addr);
	//printf("%ld\n", (long)&c);
	
	//printf("%ld\n", (long)&c - addr);
	//printf("%ld\n", addr);
	
	//printf("Call #%d\t at %p\n", n, arr);
	//printf("AR size #%d\t is %ld\n", n, (long)c - (long)arr);
	
	n++;
	
	addr = (long)arr;
	
	//free(arr);
	
	if (n <= 10)
	{
		f3();
	}
	else
	{
		return;
	}
}

void test()
{
	char *arr = (char*)malloc(sizeof(char) * SIZE);
	char *abc = (char*)malloc(sizeof(char) * SIZE);
	printf("%ld\n", (long)arr);
	static int n = 1;
	char a;
	
	n++;
	
	if (n <= 10)
	{
		test();
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
	//f3();
	test();
	
	return 0;
}
