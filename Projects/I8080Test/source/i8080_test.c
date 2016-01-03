// Intel 8080 (KR580VM80A) microprocessor core model
//
// Copyright (C) 2012 Alexander Demin <alexander@demin.ws>
//
// Credits
//
// Viacheslav Slavinsky, Vector-06C FPGA Replica
// http://code.google.com/p/vector06cc/
//
// Dmitry Tselikov, Bashrikia-2M and Radio-86RK on Altera DE1
// http://bashkiria-2m.narod.ru/fpga.html
//
// Ian Bartholomew, 8080/8085 CPU Exerciser
// http://www.idb.me.uk/sunhillow/8080.html
//
// Frank Cringle, The origianal exerciser for the Z80.
//
// Thanks to zx.pk.ru and nedopc.org/forum communities.
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.

#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "cpuI8080.h"

unsigned char memory[0x10000];
emuI8080State i8080_state;

void load_file(const char* name, unsigned char* load_to) {
	FILE* f = fopen(name, "r+b");
	int sz;
	if (!f) {
		fprintf(stderr, "Unable to open file \"%s\"\n", name);
		exit(1);
	}
	sz = 0;
	while (!feof(f)) {
		int const read = fread((void *)load_to, 1, 1024, f);
		if (read == 0) break;
		sz += read;
		load_to += read;
	}
	printf("\n*********************************\n");
	printf("File \"%s\" loaded, size %d\n", name, sz);
}

void execute_test(const char* filename, int success_check) {
	int success = 0;

	memset(memory, 0, 0x10000);
	load_file(filename, memory + 0x100);

	memory[5] = 0xC9;  // Inject RET at 0x0005 to handle "CALL 5".

	emuI8080Reset(&i8080_state);

	// jump to 0x100
	i8080_state.reg.pc = 0x100;
	while (1) 
	{
		int const pc = i8080_state.reg.pc;
		if (memory[pc] == 0x76) 
		{
			printf("HLT at %04X\n", pc);
			exit(1);
		}
		if (pc == 0x0005) 
		{
			if (i8080_state.reg.c == 9) 
			{
				int i;
				for (i = i8080_state.reg.de; memory[i] != '$'; i += 1)
					putchar(memory[i]);
				success = 1;
			}
			if (i8080_state.reg.c == 2) 
				putchar((char)i8080_state.reg.e);
		}

		emuI8080Exec(&i8080_state, 1);
		i8080_state.cycles = 0;

		if(i8080_state.reg.pc == 0x05d8)
		{
		i8080_state.cycles = 0;
		}

		
		if (i8080_state.reg.pc == 0) 
		{
			printf("\nJump to 0000 from %04X\n", pc);
			if (success_check && !success)
				exit(1);
			return;
		}
	}
}

int main() {
	execute_test("CPUTEST.COM", 0);
	//execute_test("TEST.COM", 0);
	//execute_test("8080EXER.COM", 0);
	//execute_test("8080PRE.COM", 0);
	//execute_test("8080EX1.COM", 0);
	return 0;
}


void WrI8080(register uint16_t Addr,register uint8_t Value)
{
	memory[Addr & 0xffff] = Value;
}

uint8_t RdI8080(register uint16_t Addr)
{
	return memory[Addr & 0xffff];
}

void OutI8080(register uint16_t Port,register uint8_t Value)
{
}

uint8_t InI8080(register uint16_t Port)
{
	return 0;
}