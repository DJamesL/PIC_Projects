
#include "main.h"

void initialization(void)
{

//Configure clock
OSCCONbits.SPLLEN = 0b1;	//0b1 for 32MHz
OSCCONbits.SCS = 0b00;		//0b00 for 32Mhz
OSCCONbits.IRCF = 0b1110; 	//0b1110 for 32MHz


//OSCCON = 0x78;
//watchdog timer @ 512ms
WDTCONbits.WDTPS = 0x09;

//Analog-to-Digital modules

ANSELA = 0b00000100;
//ANSELAbits.ANSA2 = 0b1;
ANSELB = 0x00;

//set-up ADC variables
ADCON0	= 0b00001001;
//        0bx00010--	Select AN2 (RA2, pin 1)
//		  0bx-----0-	ADC cycle in-progress, '0' if done
//		  0bx------1	Enable ADC
			
ADCON1	= 0b10100000;
//      0b1---x---	right justified
//		0b-010x---	Fosc/32 = 1usec
//		0b----x0--	Vref- is Vss
//		0b----x-00	Vref+ is Vcc




//Set-up Option reg
OPTION_REG = 0x00;

//OPTION_REGbits.nWPUEN  = 0b1; //disable internal pull-ups
//OPTION_REGbits.TMR0CS  = 0b0; // internal RC as clock sources
//OPTION_REGbits.PSA = 0b0; // internal clock assigned to TMR0 (fcpu/4)
//OPTION_REGbits.PS = 0b110; //prescaler 1:128



//TMR0 = INIT_TMR0;

SSP1MSK	=	0x00;
SSP2MSK	=	0x00;
PSTR1CON	=	0x00;
PSTR2CON	=	0x00;
PR2 = 0x00;
//Set-up Interrupt config register
INTCON = 0x00;
INTCONbits.GIE = 0b1; //global interrupt ON
INTCONbits.PEIE = 0b1; ///Peripheral Interrupt global
//INTCONbits.TMR0IE = 0b1; //TMR0 overflow ON
//PIE1 = 0x00;
PIE1bits.ADIE = 0b1;	//Enable ADC interrupt

//Port/pins directions

TRISA = TRISA_CONFIG;
TRISB = TRISB_CONFIG;

output_a(INIT_PORTA);
output_b(INIT_PORTB);

}



