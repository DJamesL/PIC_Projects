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


int i8_LED1_time, i8_LED2_time, i8_LED3_time, i8_LED4_time, i8_switch_debounce;
bit new1, new2, new3, new4;

void main(void)
{
	initialization();
	new1 = 0b1;
	new2 = 0b1;
	new3 = 0b1; 
	new4 = 0b1;
	i8_LED1_time = k8_time1;
	i8_LED2_time = k8_time2;
	i8_LED3_time = k8_time3;
	i8_LED4_time = k8_time4;
	TMR0 = INIT_TMR0;
	while(1)
	{
		if(!i8_LED1_time)
		{
			i8_LED1_time = k8_time1;
			PINOUT_LED1_A1 = new1;
			new1 = ~new1;
		}
		if(!i8_LED2_time)
		{
			i8_LED2_time = k8_time2;
			PINOUT_LED2_A0 = new2;
			new2 = ~new2;
		}
		if(!i8_LED3_time)
		{
			i8_LED3_time = k8_time3;
			PINOUT_LED3_A7 = new3;
			new3 = ~new3;
		}
		if(!i8_LED4_time)
		{
			i8_LED4_time = k8_time4;
			PINOUT_LED4_A6 = new4;
			new4 = ~new4;
		}
		if(!PININ_SW1_B0)
		{
			if(!i8_switch_debounce)
			{
				PINOUT_LED4_A6 = 0b1;
			}
		}
		else
		{
			i8_switch_debounce = k8_switch_debounce;
			PININ_SW1_B0 = 0b1;
		
		}
		CLRWDT();
	//	new = ~new;
	}
}


void interrupt isr(void)	//Interrupt handler routine
{
	if(T0IF)
		{
			TMR0 = INIT_TMR0;
			T0IF = 0b0; //Clear TMR0 flag
			INTCONbits.GIE = 0b0;  //prevent encoutering other interrupts, while in interrupt routine
			if(i8_LED1_time)
			{
				i8_LED1_time--;
			}
			if(i8_LED2_time)
			{
				i8_LED2_time--;
			}
			if(i8_LED3_time)
			{
				i8_LED3_time--;
			}
			if(i8_LED4_time)
			{
				i8_LED4_time--;
			}
			if(i8_switch_debounce)
			{
				i8_switch_debounce--;
			}
			INTCONbits.GIE = 0b1; // enable interrupt before leaving
			 
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
