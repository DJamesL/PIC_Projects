opt subtitle "HI-TECH Software Omniscient Code Generator (Standard mode) build 7503"

opt pagewidth 120

	opt sm

	processor	16F1827
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
indf1	equ	1
pc	equ	2
pcl	equ	2
status	equ	3
fsr0l	equ	4
fsr0h	equ	5
fsr1l	equ	6
fsr1h	equ	7
bsr	equ	8
wreg	equ	9
intcon	equ	11
c	equ	1
z	equ	0
pclath	equ	10
# 17 "D:\Projects_LOCAL\PIC16F1827\ADC\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 17 "D:\Projects_LOCAL\PIC16F1827\ADC\main.c"
	dw 0xFFFF & 0xFFFF & 0xFFFF & 0xFFFF & 0xFFFC & 0xFFFF ;#
# 18 "D:\Projects_LOCAL\PIC16F1827\ADC\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 18 "D:\Projects_LOCAL\PIC16F1827\ADC\main.c"
	dw 0xFDFF & 0xFFFF & 0xFFFF & 0xFEFF & 0xDFFF ;#
	FNCALL	_main,_initialization
	FNCALL	_initialization,_output_a
	FNCALL	_initialization,_output_b
	FNROOT	_main
	FNCALL	intlevel1,_isr
	global	intlevel1
	FNROOT	intlevel1
	global	_u16Temp
	global	_INTCON
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
_INTCON	set	11
	global	_INTCONbits
_INTCONbits	set	11
	global	_PORTA
_PORTA	set	12
	global	_PORTB
_PORTB	set	13
	global	_PR2
_PR2	set	27
	global	_ADIF
_ADIF	set	142
	global	_RA0
_RA0	set	96
	global	_RA1
_RA1	set	97
	global	_RA6
_RA6	set	102
	global	_RA7
_RA7	set	103
	global	_ADCON0
_ADCON0	set	157
	global	_ADCON1
_ADCON1	set	158
	global	_ADRESH
_ADRESH	set	156
	global	_ADRESL
_ADRESL	set	155
	global	_OPTION_REG
_OPTION_REG	set	149
	global	_OSCCONbits
_OSCCONbits	set	153
	global	_PIE1bits
_PIE1bits	set	145
	global	_TRISA
_TRISA	set	140
	global	_TRISB
_TRISB	set	141
	global	_WDTCONbits
_WDTCONbits	set	151
	global	_GO_nDONE
_GO_nDONE	set	1257
	global	_ANSELA
_ANSELA	set	396
	global	_ANSELB
_ANSELB	set	397
	global	_SSP1MSK
_SSP1MSK	set	531
	global	_SSP2MSK
_SSP2MSK	set	539
	global	_PSTR1CON
_PSTR1CON	set	662
	global	_PSTR2CON
_PSTR2CON	set	669
	file	"ADC.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_u16Temp:
       ds      2

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	global __pbssCOMMON
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
movlb 0
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_initialization
?_initialization:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_isr
?_isr:	; 0 bytes @ 0x0
	global	??_isr
??_isr:	; 0 bytes @ 0x0
	ds	4
	global	?_output_a
?_output_a:	; 0 bytes @ 0x4
	global	?_output_b
?_output_b:	; 0 bytes @ 0x4
	global	output_a@x
output_a@x:	; 2 bytes @ 0x4
	global	output_b@x
output_b@x:	; 2 bytes @ 0x4
	ds	2
	global	??_output_a
??_output_a:	; 0 bytes @ 0x6
	global	??_output_b
??_output_b:	; 0 bytes @ 0x6
	global	??_initialization
??_initialization:	; 0 bytes @ 0x6
	global	??_main
??_main:	; 0 bytes @ 0x6
;;Data sizes: Strings 0, constant 0, data 0, bss 2, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      6       8
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK2           80      0       0
;; BANK3           80      0       0
;; BANK4           48      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _initialization->_output_a
;;   _initialization->_output_b
;;
;; Critical Paths under _isr in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _isr in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _isr in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _isr in BANK2
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _isr in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK4
;;
;;   None.
;;
;; Critical Paths under _isr in BANK4
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0      30
;;                     _initialization
;; ---------------------------------------------------------------------------------
;; (1) _initialization                                       0     0      0      30
;;                           _output_a
;;                           _output_b
;; ---------------------------------------------------------------------------------
;; (2) _output_b                                             2     0      2      15
;;                                              4 COMMON     2     0      2
;; ---------------------------------------------------------------------------------
;; (2) _output_a                                             2     0      2      15
;;                                              4 COMMON     2     0      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (3) _isr                                                  4     4      0       0
;;                                              0 COMMON     4     4      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _initialization
;;     _output_a
;;     _output_b
;;
;; _isr (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BIGRAM             170      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;BITCOMMON            E      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;COMMON               E      6       8       2       57.1%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR2              0      0       0       3        0.0%
;;SFR2                 0      0       0       3        0.0%
;;STACK                0      0       2       3        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;ABS                  0      0       8       4        0.0%
;;BITBANK0            50      0       0       5        0.0%
;;BITSFR4              0      0       0       5        0.0%
;;SFR4                 0      0       0       5        0.0%
;;BANK0               50      0       0       6        0.0%
;;BITSFR5              0      0       0       6        0.0%
;;SFR5                 0      0       0       6        0.0%
;;BITBANK1            50      0       0       7        0.0%
;;BITSFR6              0      0       0       7        0.0%
;;SFR6                 0      0       0       7        0.0%
;;BANK1               50      0       0       8        0.0%
;;BITSFR7              0      0       0       8        0.0%
;;SFR7                 0      0       0       8        0.0%
;;BITBANK2            50      0       0       9        0.0%
;;BITSFR8              0      0       0       9        0.0%
;;SFR8                 0      0       0       9        0.0%
;;BANK2               50      0       0      10        0.0%
;;BITSFR9              0      0       0      10        0.0%
;;SFR9                 0      0       0      10        0.0%
;;BITBANK3            50      0       0      11        0.0%
;;BITSFR10             0      0       0      11        0.0%
;;SFR10                0      0       0      11        0.0%
;;BANK3               50      0       0      12        0.0%
;;BITSFR11             0      0       0      12        0.0%
;;SFR11                0      0       0      12        0.0%
;;BITBANK4            30      0       0      13        0.0%
;;BITSFR12             0      0       0      13        0.0%
;;SFR12                0      0       0      13        0.0%
;;BANK4               30      0       0      14        0.0%
;;BITSFR13             0      0       0      14        0.0%
;;SFR13                0      0       0      14        0.0%
;;BITSFR14             0      0       0      15        0.0%
;;SFR14                0      0       0      15        0.0%
;;DATA                 0      0       A      15        0.0%
;;BITSFR15             0      0       0      16        0.0%
;;SFR15                0      0       0      16        0.0%
;;BITSFR16             0      0       0      17        0.0%
;;SFR16                0      0       0      17        0.0%
;;BITSFR17             0      0       0      18        0.0%
;;SFR17                0      0       0      18        0.0%
;;BITSFR18             0      0       0      19        0.0%
;;SFR18                0      0       0      19        0.0%
;;BITSFR19             0      0       0      20        0.0%
;;SFR19                0      0       0      20        0.0%
;;BITSFR20             0      0       0      21        0.0%
;;SFR20                0      0       0      21        0.0%
;;BITSFR21             0      0       0      22        0.0%
;;SFR21                0      0       0      22        0.0%
;;BITSFR22             0      0       0      23        0.0%
;;SFR22                0      0       0      23        0.0%
;;BITSFR23             0      0       0      24        0.0%
;;SFR23                0      0       0      24        0.0%
;;BITSFR24             0      0       0      25        0.0%
;;SFR24                0      0       0      25        0.0%
;;BITSFR25             0      0       0      26        0.0%
;;SFR25                0      0       0      26        0.0%
;;BITSFR26             0      0       0      27        0.0%
;;SFR26                0      0       0      27        0.0%
;;BITSFR27             0      0       0      28        0.0%
;;SFR27                0      0       0      28        0.0%
;;BITSFR28             0      0       0      29        0.0%
;;SFR28                0      0       0      29        0.0%
;;BITSFR29             0      0       0      30        0.0%
;;SFR29                0      0       0      30        0.0%
;;BITSFR30             0      0       0      31        0.0%
;;SFR30                0      0       0      31        0.0%
;;BITSFR31             0      0       0      32        0.0%
;;SFR31                0      0       0      32        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 24 in file "D:\Projects_LOCAL\PIC16F1827\ADC\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_initialization
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\Projects_LOCAL\PIC16F1827\ADC\main.c"
	line	24
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 13
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	26
	
l2664:	
;main.c: 26: initialization();
	fcall	_initialization
	line	27
	
l2666:	
;main.c: 27: GO_nDONE = 1;
	movlb 1	; select bank1
	bsf	(1257/8)^080h,(1257)&7
	goto	l2668
	line	28
;main.c: 28: while(1)
	
l1438:	
	line	36
	
l2668:	
;main.c: 29: {
;main.c: 36: if(u16Temp >= 0x022E)
	movlw	high(022Eh)
	subwf	(_u16Temp+1),w
	movlw	low(022Eh)
	skipnz
	subwf	(_u16Temp),w
	skipc
	goto	u2081
	goto	u2080
u2081:
	goto	l2672
u2080:
	line	38
	
l2670:	
;main.c: 37: {
;main.c: 38: RA1 = 0;
	movlb 0	; select bank0
	bcf	(97/8),(97)&7
	goto	l2672
	line	39
	
l1439:	
	line	40
	
l2672:	
;main.c: 39: }
;main.c: 40: if(u16Temp >= 0x02D7)
	movlw	high(02D7h)
	subwf	(_u16Temp+1),w
	movlw	low(02D7h)
	skipnz
	subwf	(_u16Temp),w
	skipc
	goto	u2091
	goto	u2090
u2091:
	goto	l2676
u2090:
	line	42
	
l2674:	
;main.c: 41: {
;main.c: 42: RA0 = 0;
	movlb 0	; select bank0
	bcf	(96/8),(96)&7
	goto	l2676
	line	43
	
l1440:	
	line	44
	
l2676:	
;main.c: 43: }
;main.c: 44: if(u16Temp >= 0x0327)
	movlw	high(0327h)
	subwf	(_u16Temp+1),w
	movlw	low(0327h)
	skipnz
	subwf	(_u16Temp),w
	skipc
	goto	u2101
	goto	u2100
u2101:
	goto	l2680
u2100:
	line	46
	
l2678:	
;main.c: 45: {
;main.c: 46: RA7 = 0;
	movlb 0	; select bank0
	bcf	(103/8),(103)&7
	goto	l2680
	line	47
	
l1441:	
	line	48
	
l2680:	
;main.c: 47: }
;main.c: 48: if(u16Temp >= 0x0353)
	movlw	high(0353h)
	subwf	(_u16Temp+1),w
	movlw	low(0353h)
	skipnz
	subwf	(_u16Temp),w
	skipc
	goto	u2111
	goto	u2110
u2111:
	goto	l1442
u2110:
	line	50
	
l2682:	
;main.c: 49: {
;main.c: 50: RA6 = 0;
	movlb 0	; select bank0
	bcf	(102/8),(102)&7
	line	51
;main.c: 51: }
	goto	l1443
	line	52
	
l1442:	
	line	54
;main.c: 52: else
;main.c: 53: {
;main.c: 54: RA1 = 1;
	movlb 0	; select bank0
	bsf	(97/8),(97)&7
	line	55
;main.c: 55: RA0 = 1;
	bsf	(96/8),(96)&7
	line	56
;main.c: 56: RA6 = 1;
	bsf	(102/8),(102)&7
	line	57
;main.c: 57: RA7 = 1;
	bsf	(103/8),(103)&7
	line	58
	
l1443:	
	line	59
# 59 "D:\Projects_LOCAL\PIC16F1827\ADC\main.c"
clrwdt ;#
psect	maintext
	goto	l2668
	line	61
	
l1444:	
	line	28
	goto	l2668
	
l1445:	
	line	62
	
l1446:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_initialization
psect	text99,local,class=CODE,delta=2
global __ptext99
__ptext99:

;; *************** function _initialization *****************
;; Defined at:
;;		line 5 in file "D:\Projects_LOCAL\PIC16F1827\ADC\Peripheral_Initialization.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_output_a
;;		_output_b
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text99
	file	"D:\Projects_LOCAL\PIC16F1827\ADC\Peripheral_Initialization.h"
	line	5
	global	__size_of_initialization
	__size_of_initialization	equ	__end_of_initialization-_initialization
	
_initialization:	
	opt	stack 13
; Regs used in _initialization: [wreg+status,2+status,0+pclath+cstack]
	line	8
	
l2624:	
;Peripheral_Initialization.h: 8: OSCCONbits.SPLLEN = 0b1;
	movlb 1	; select bank1
	bsf	(153)^080h,7	;volatile
	line	9
	
l2626:	
;Peripheral_Initialization.h: 9: OSCCONbits.SCS = 0b00;
	movlw	((0 & ((1<<2)-1))<<0)|not (((1<<2)-1)<<0)
	andwf	(153)^080h,f	;volatile
	line	10
;Peripheral_Initialization.h: 10: OSCCONbits.IRCF = 0b1110;
	movf	(153)^080h,w	;volatile
	andlw	not (((1<<4)-1)<<3)
	iorlw	(0Eh & ((1<<4)-1))<<3
	movwf	(153)^080h	;volatile
	line	15
;Peripheral_Initialization.h: 15: WDTCONbits.WDTPS = 0x09;
	movf	(151)^080h,w	;volatile
	andlw	not (((1<<5)-1)<<1)
	iorlw	(09h & ((1<<5)-1))<<1
	movwf	(151)^080h	;volatile
	line	19
	
l2628:	
;Peripheral_Initialization.h: 19: ANSELA = 0b00000100;
	movlw	(04h)
	movlb 3	; select bank3
	movwf	(396)^0180h	;volatile
	line	21
	
l2630:	
;Peripheral_Initialization.h: 21: ANSELB = 0x00;
	clrf	(397)^0180h	;volatile
	line	24
	
l2632:	
;Peripheral_Initialization.h: 24: ADCON0 = 0b00001001;
	movlw	(09h)
	movlb 1	; select bank1
	movwf	(157)^080h	;volatile
	line	29
	
l2634:	
;Peripheral_Initialization.h: 29: ADCON1 = 0b10100000;
	movlw	(0A0h)
	movwf	(158)^080h	;volatile
	line	39
	
l2636:	
;Peripheral_Initialization.h: 39: OPTION_REG = 0x00;
	clrf	(149)^080h	;volatile
	line	50
	
l2638:	
;Peripheral_Initialization.h: 50: SSP1MSK = 0x00;
	movlb 4	; select bank4
	clrf	(531)^0200h	;volatile
	line	51
	
l2640:	
;Peripheral_Initialization.h: 51: SSP2MSK = 0x00;
	clrf	(539)^0200h	;volatile
	line	52
	
l2642:	
;Peripheral_Initialization.h: 52: PSTR1CON = 0x00;
	movlb 5	; select bank5
	clrf	(662)^0280h	;volatile
	line	53
	
l2644:	
;Peripheral_Initialization.h: 53: PSTR2CON = 0x00;
	clrf	(669)^0280h	;volatile
	line	54
	
l2646:	
;Peripheral_Initialization.h: 54: PR2 = 0x00;
	movlb 0	; select bank0
	clrf	(27)	;volatile
	line	56
	
l2648:	
;Peripheral_Initialization.h: 56: INTCON = 0x00;
	clrf	(11)	;volatile
	line	57
	
l2650:	
;Peripheral_Initialization.h: 57: INTCONbits.GIE = 0b1;
	bsf	(11),7	;volatile
	line	58
	
l2652:	
;Peripheral_Initialization.h: 58: INTCONbits.PEIE = 0b1;
	bsf	(11),6	;volatile
	line	61
	
l2654:	
;Peripheral_Initialization.h: 61: PIE1bits.ADIE = 0b1;
	movlb 1	; select bank1
	bsf	(145)^080h,6	;volatile
	line	65
	
l2656:	
;Peripheral_Initialization.h: 65: TRISA = 0b00000100;
	movlw	(04h)
	movwf	(140)^080h	;volatile
	line	66
	
l2658:	
;Peripheral_Initialization.h: 66: TRISB = 0b00000000;
	clrf	(141)^080h	;volatile
	line	68
	
l2660:	
;Peripheral_Initialization.h: 68: output_a(0b11000011);
	movlw	low(0C3h)
	movwf	(?_output_a)
	movlw	high(0C3h)
	movwf	((?_output_a))+1
	fcall	_output_a
	line	69
	
l2662:	
;Peripheral_Initialization.h: 69: output_b(0x00);
	movlw	low(0)
	movwf	(?_output_b)
	movlw	high(0)
	movwf	((?_output_b))+1
	fcall	_output_b
	line	71
	
l1435:	
	return
	opt stack 0
GLOBAL	__end_of_initialization
	__end_of_initialization:
;; =============== function _initialization ends ============

	signat	_initialization,88
	global	_output_b
psect	text100,local,class=CODE,delta=2
global __ptext100
__ptext100:

;; *************** function _output_b *****************
;; Defined at:
;;		line 88 in file "D:\Projects_LOCAL\PIC16F1827\ADC\main.c"
;; Parameters:    Size  Location     Type
;;  x               2    4[COMMON] int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         2       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_initialization
;; This function uses a non-reentrant model
;;
psect	text100
	file	"D:\Projects_LOCAL\PIC16F1827\ADC\main.c"
	line	88
	global	__size_of_output_b
	__size_of_output_b	equ	__end_of_output_b-_output_b
	
_output_b:	
	opt	stack 13
; Regs used in _output_b: [wreg]
	line	89
	
l1830:	
;main.c: 89: PORTB = x;
	movf	(output_b@x),w
	movlb 0	; select bank0
	movwf	(13)	;volatile
	line	90
	
l1456:	
	return
	opt stack 0
GLOBAL	__end_of_output_b
	__end_of_output_b:
;; =============== function _output_b ends ============

	signat	_output_b,4216
	global	_output_a
psect	text101,local,class=CODE,delta=2
global __ptext101
__ptext101:

;; *************** function _output_a *****************
;; Defined at:
;;		line 83 in file "D:\Projects_LOCAL\PIC16F1827\ADC\main.c"
;; Parameters:    Size  Location     Type
;;  x               2    4[COMMON] int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         2       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_initialization
;; This function uses a non-reentrant model
;;
psect	text101
	file	"D:\Projects_LOCAL\PIC16F1827\ADC\main.c"
	line	83
	global	__size_of_output_a
	__size_of_output_a	equ	__end_of_output_a-_output_a
	
_output_a:	
	opt	stack 13
; Regs used in _output_a: [wreg]
	line	84
	
l1828:	
;main.c: 84: PORTA = x;
	movf	(output_a@x),w
	movlb 0	; select bank0
	movwf	(12)	;volatile
	line	85
	
l1453:	
	return
	opt stack 0
GLOBAL	__end_of_output_a
	__end_of_output_a:
;; =============== function _output_a ends ============

	signat	_output_a,4216
	global	_isr
psect	intentry

;; *************** function _isr *****************
;; Defined at:
;;		line 66 in file "D:\Projects_LOCAL\PIC16F1827\ADC\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          4       0       0       0       0       0
;;      Totals:         4       0       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	intentry
	file	"D:\Projects_LOCAL\PIC16F1827\ADC\main.c"
	line	66
	global	__size_of_isr
	__size_of_isr	equ	__end_of_isr-_isr
	
_isr:	
	opt	stack 13
; Regs used in _isr: [wreg+status,2+status,0]
psect	intentry
	pagesel	$
	line	67
	
i1l1832:	
;main.c: 67: if(ADIF)
	movlb 0	; select bank0
	btfss	(142/8),(142)&7
	goto	u1_21
	goto	u1_20
u1_21:
	goto	i1l1450
u1_20:
	line	69
	
i1l1834:	
;main.c: 68: {
;main.c: 69: ADIF = 0;
	bcf	(142/8),(142)&7
	line	70
;main.c: 70: INTCONbits.GIE = 0;
	bcf	(11),7	;volatile
	line	71
	
i1l1836:	
;main.c: 71: u16Temp = ADRESH;
	movlb 1	; select bank1
	movf	(156)^080h,w	;volatile
	movwf	(??_isr+0)+0
	clrf	(??_isr+0)+0+1
	movf	0+(??_isr+0)+0,w
	movwf	(_u16Temp)
	movf	1+(??_isr+0)+0,w
	movwf	(_u16Temp+1)
	line	72
	
i1l1838:	
;main.c: 72: u16Temp = (u16Temp<<8) + ADRESL;
	movf	(155)^080h,w	;volatile
	movwf	(??_isr+0)+0
	clrf	(??_isr+0)+0+1
	movf	(_u16Temp),w
	movwf	(??_isr+2)+0+1
	clrf	(??_isr+2)+0
	movf	0+(??_isr+0)+0,w
	addwf	0+(??_isr+2)+0,w
	movwf	(_u16Temp)
	movf	1+(??_isr+0)+0,w
	addwfc	1+(??_isr+2)+0,w
	movwf	1+(_u16Temp)
	line	74
	
i1l1840:	
;main.c: 74: GO_nDONE = 1;
	bsf	(1257/8)^080h,(1257)&7
	line	75
	
i1l1842:	
;main.c: 75: INTCONbits.GIE = 0b1;
	bsf	(11),7	;volatile
	goto	i1l1450
	line	76
	
i1l1449:	
	line	79
	
i1l1450:	
	retfie
	opt stack 0
GLOBAL	__end_of_isr
	__end_of_isr:
;; =============== function _isr ends ============

	signat	_isr,88
psect	intentry
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
