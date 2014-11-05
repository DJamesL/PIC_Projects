//BASIC I/O Practice Using C
//Standardize 
// Base from PIC16F1827_standard_project v1.0
//


#include <pic.h>
#include "main.h"
#include "Peripheral_Initialization.h"
#include <pic16f1827.h>
#include <STDLIB.H>
//#include <16F777.h>



//__PIC16F1827__
__CONFIG(CP_OFF & CPD_OFF & WDTE_ON & BOREN_ON & FOSC_INTOSC & CLKOUTEN_OFF);
__CONFIG(STVREN_OFF & WRT_OFF & BORV_19 & PLLEN_OFF & LVP_OFF);
//
#define _XTAL_FREQ 16000000
static unsigned int	u16Temp = 0x0000;

void main(void)
{
//	unsigned int	u16Temp = 0x0000;
	initialization();
	GO_nDONE = 1;
	while(1)
	{
//		__delay_us(10);
//		GO_nDONE = 1;
//		while(GO_nDONE)
//			;
//		u16Temp = ADRESH;
//		u16Temp = (u16Temp<<8) + ADRESL;
		if(u16Temp >= 0x022E)
			{
				PINOUT_LED1_A1 = 0;
			}
		if(u16Temp >= 0x02D7)
			{
				PINOUT_LED2_A0 = 0;
			}
		if(u16Temp >= 0x0327)
			{
				PINOUT_LED3_A7 = 0;
			}
		if(u16Temp >= 0x0353)
			{
				PINOUT_LED4_A6 = 0;
			}
		else
			{
				PINOUT_LED1_A1 = 1;
				PINOUT_LED2_A0 = 1;
				PINOUT_LED4_A6 = 1;
				PINOUT_LED3_A7 = 1;
			}		
		CLRWDT();
	//	new = ~new;
	}
}


void interrupt isr(void)	//Interrupt handler routine
{
		if(ADIF)
		{
			ADIF = 0;
			INTCONbits.GIE = 0;
			u16Temp = ADRESH;
			u16Temp = (u16Temp<<8) + ADRESL;
		//	PINOUT_LED1_A1 = 0;
			GO_nDONE = 1;
			INTCONbits.GIE = 0b1;
		}
		
	
}


void output_a(int x)
{
	PORTA = x;
}

void output_b(int x)
{
	PORTB = x;
}

void out_PORTA(int x)	//with shadow
{
	int i8local;
	i8local = x;
	PORTA = i8local;
}
