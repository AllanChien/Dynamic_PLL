/*
 * "Hello World" example.
 *
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example
 * designs. It runs with or without the MicroC/OS-II RTOS and requires a STDOUT
 * device in your system's hardware.
 * The memory footprint of this hosted application is ~69 kbytes by default
 * using the standard reference design.
 *
 * For a reduced footprint version of this template, and an explanation of how
 * to reduce the memory footprint for a given application, see the
 * "small_hello_world" template.
 *
 */

#include <stdio.h>
#include "system.h"
#include "altera_avalon_pio_regs.h"


int epic = 0;
int testforstupid = 10;


int ledflashstate = 0;
int count = 0;

int hexcount = 0;

int sevenSegmentPatterns[] = {
		0b1000000, // 0
		0b1111001, // 1
		0b0100100, // 2
		0b0110000, // 3
		0b0011001, // 4
		0b0010010, // 5
		0b0000010, // 6
		0b1111000, // 7
		0b0000000, // 8
		0b0010000  // 9
	};

int main()
{
	while(1){

		if (count >= 100000){
//		  printf("Hello from Nios II!\n");

			IOWR_ALTERA_AVALON_PIO_DATA(LED_PIO_BASE, ledflashstate);
			ledflashstate = !ledflashstate;

		  epic = testforstupid;
		  testforstupid = testforstupid + epic;
		  count = 0;
		}else{
			count = count + 1;
		}


		IOWR_ALTERA_AVALON_PIO_DATA(SEG1_PIO_BASE, sevenSegmentPatterns[hexcount]);
		if (hexcount >= 10){
			hexcount = 0;
		}else{
			hexcount += 1;
		}
	}
  return 0;
}
