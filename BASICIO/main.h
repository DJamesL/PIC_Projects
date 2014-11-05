//#include "Peripheral_Initialization.h"

void toggle(int new);// CCS C like 
void output_a(int porta);// CCS C like
void output_b(int porta);// CCS C like
void out_PORTA(int x); 
//void output_c(int porta);
//void output_d(int porta); 

#define INIT_TMR0 0x06; //6

//------------------------------------------------------------------------------
//PIC16F1827,, DIP version
//------------------------------------------------------------------------------
	// PORTA
	#define 	INIT_PORTA 			0b00000100
	#define 	TRISA_CONFIG 		0b00000100
	#define		PINOUT_LED2_A0		RA0	 	//pin17, Unused, Output, N/A
	#define		PINOUT_LED1_A1		RA1	 	//pin18, Unused, Output, N/A 
	#define		PINOUT_unusedA2		RA2	 	//pin01, Unused, Output, N/A
	#define		PINOUT_unusedA3		RA3	 	//pin02, Unused, Output, N/A  
	#define		PINOUT_unusedA4    	RA4	 	//pin03, Unused, Output, N/A
	#define		PININ_MCLR_A5		RA5	 	//pin04, MCLR, Input, Digital
	#define		PINOUT_LED4_A6		RA6	 	//pin15, Unused, Output, N/A  
	#define		PINOUT_LED3_A7		RA7	 	//pin16, Unused, Output, N/A 

	// PORTB
	#define 	INIT_PORTB 			0x00
	#define 	TRISB_CONFIG 		0b00000001
	#define		PININ_SW1_B0			RB0	 	//pin06, Slide Switch, Input, N/A
	#define		PININ_SW2_B1			RB1	 	//pin07, Slide Switch, Input, N/A 
	#define		PININ_SW3_B2			RB2	 	//pin08, Slide Switch, Input, N/A
	#define		PININ_PBUTTON_B3		RB3	 	//pin09, Push button  Switch, Input, Active Low
	#define		PINOUT_unusedB4    		RB4	 	//pin10, MCLR, Input, Digital 
	#define		PINOUT_unusedB5			RB5	 	//pin11, Unused, Output, N/A 
	#define		PINOUT_unusedB6			RB6	 	//pin12, Unused, Output, N/A  
	#define		PINOUT_unusedB7			RB7	 	//pin13, Unused, Output, N/A 



	#define k8_time1  250
	#define k8_time2  188
	#define k8_time3  188
	#define k8_time4  125
	#define k8_switch_debounce 25



