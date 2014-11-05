
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

ANSELA = 0x00;
ANSELB = 0x00;

//Set-up Option reg
OPTION_REG = 0x00;

OPTION_REGbits.nWPUEN  = 0b1; //disable internal pull-ups
OPTION_REGbits.TMR0CS  = 0b0; // internal RC as clock sources
OPTION_REGbits.PSA = 0b0; // internal clock assigned to TMR0 (fcpu/4)
OPTION_REGbits.PS = 0b110; //prescaler 1:128



TMR0 = INIT_TMR0;

SSP1MSK	=	0x00;
SSP2MSK	=	0x00;
PSTR1CON	=	0x00;
PSTR2CON	=	0x00;
PR2 = 0x00;
//Set-up Interrupt config register
INTCONbits.GIE = 0b1; //global interrupt ON
INTCONbits.TMR0IE = 0b1; //TMR0 overflow ON

//Port/pins directions

output_a(INIT_PORTA);
output_b(INIT_PORTB);

TRISA = TRISA_CONFIG;
TRISB = TRISB_CONFIG;

}



