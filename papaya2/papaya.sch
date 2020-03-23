EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "15 nov 2012"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:+5V #PWR01
U 1 1 580C1B61
P 3550 950
F 0 "#PWR01" H 3550 800 50  0001 C CNN
F 1 "+5V" H 3550 1090 50  0000 C CNN
F 2 "" H 3550 950 50  0000 C CNN
F 3 "" H 3550 950 50  0000 C CNN
	1    3550 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 950  3550 1100
Wire Wire Line
	3550 1100 3350 1100
Wire Wire Line
	3550 1200 3350 1200
Connection ~ 3550 1100
$Comp
L power:GND #PWR02
U 1 1 580C1D11
P 3450 3150
F 0 "#PWR02" H 3450 2900 50  0001 C CNN
F 1 "GND" H 3450 3000 50  0000 C CNN
F 2 "" H 3450 3150 50  0000 C CNN
F 3 "" H 3450 3150 50  0000 C CNN
	1    3450 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 1300 3450 1700
Wire Wire Line
	3450 2700 3350 2700
Wire Wire Line
	3450 2500 3350 2500
Connection ~ 3450 2700
Wire Wire Line
	3450 2000 3350 2000
Connection ~ 3450 2500
Wire Wire Line
	3450 1700 3350 1700
Connection ~ 3450 2000
$Comp
L power:GND #PWR03
U 1 1 580C1E01
P 2750 3150
F 0 "#PWR03" H 2750 2900 50  0001 C CNN
F 1 "GND" H 2750 3000 50  0000 C CNN
F 2 "" H 2750 3150 50  0000 C CNN
F 3 "" H 2750 3150 50  0000 C CNN
	1    2750 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 3000 2850 3000
Wire Wire Line
	2750 1500 2750 2300
Wire Wire Line
	2750 2300 2850 2300
Connection ~ 2750 3000
Connection ~ 2650 1100
Wire Wire Line
	2650 1900 2850 1900
Wire Wire Line
	2650 1100 2850 1100
Wire Wire Line
	2650 950  2650 1100
$Comp
L power:+3.3V #PWR04
U 1 1 580C1BC1
P 2650 950
F 0 "#PWR04" H 2650 800 50  0001 C CNN
F 1 "+3.3V" H 2650 1090 50  0000 C CNN
F 2 "" H 2650 950 50  0000 C CNN
F 3 "" H 2650 950 50  0000 C CNN
	1    2650 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 1500 2850 1500
Connection ~ 2750 2300
Wire Wire Line
	3450 1300 3350 1300
Connection ~ 3450 1700
Text Notes 650  7600 0    50   ~ 0
ID_SD and ID_SC PINS:\nThese pins are reserved for HAT ID EEPROM.\n\nAt boot time this I2C interface will be\ninterrogated to look for an EEPROM\nthat identifes the attached board and\nallows automagic setup of the GPIOs\n(and optionally, Linux drivers).\n\nDO NOT USE these pins for anything other\nthan attaching an I2C ID EEPROM. Leave\nunconnected if ID EEPROM not required.
$Comp
L papaya-rescue:Mounting_Hole-Mechanical MK1
U 1 1 5834FB2E
P 3000 7200
F 0 "MK1" H 3100 7246 50  0000 L CNN
F 1 "M2.5" H 3100 7155 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 3000 7200 60  0001 C CNN
F 3 "" H 3000 7200 60  0001 C CNN
	1    3000 7200
	1    0    0    -1  
$EndComp
$Comp
L papaya-rescue:Mounting_Hole-Mechanical MK3
U 1 1 5834FBEF
P 3450 7200
F 0 "MK3" H 3550 7246 50  0000 L CNN
F 1 "M2.5" H 3550 7155 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 3450 7200 60  0001 C CNN
F 3 "" H 3450 7200 60  0001 C CNN
	1    3450 7200
	1    0    0    -1  
$EndComp
$Comp
L papaya-rescue:Mounting_Hole-Mechanical MK2
U 1 1 5834FC19
P 3000 7400
F 0 "MK2" H 3100 7446 50  0000 L CNN
F 1 "M2.5" H 3100 7355 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 3000 7400 60  0001 C CNN
F 3 "" H 3000 7400 60  0001 C CNN
	1    3000 7400
	1    0    0    -1  
$EndComp
$Comp
L papaya-rescue:Mounting_Hole-Mechanical MK4
U 1 1 5834FC4F
P 3450 7400
F 0 "MK4" H 3550 7446 50  0000 L CNN
F 1 "M2.5" H 3550 7355 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 3450 7400 60  0001 C CNN
F 3 "" H 3450 7400 60  0001 C CNN
	1    3450 7400
	1    0    0    -1  
$EndComp
Text Notes 3000 7050 0    50   ~ 0
Mounting Holes
$Comp
L Connector_Generic:Conn_02x20_Odd_Even P1
U 1 1 59AD464A
P 3050 2000
F 0 "P1" H 3100 3117 50  0000 C CNN
F 1 "Conn_02x20_Odd_Even" H 3100 3026 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x20_P2.54mm_Vertical" H -1800 1050 50  0001 C CNN
F 3 "" H -1800 1050 50  0001 C CNN
	1    3050 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 1100 3550 1200
Wire Wire Line
	3450 2700 3450 3150
Wire Wire Line
	3450 2500 3450 2700
Wire Wire Line
	3450 2000 3450 2500
Wire Wire Line
	2750 3000 2750 3150
Wire Wire Line
	2650 1100 2650 1900
Wire Wire Line
	2750 2300 2750 3000
Wire Wire Line
	3450 1700 3450 2000
$Comp
L Audio:AY-3-8912 U1
U 1 1 5E2806BC
P 6250 2350
F 0 "U1" H 6250 4031 50  0000 C CNN
F 1 "AY-3-8912" H 6250 3940 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_LongPads" H 6250 2750 50  0001 C CNN
F 3 "http://map.grauw.nl/resources/sound/generalinstrument_ay-3-8910.pdf" H 6250 2750 50  0001 C CNN
	1    6250 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5E2B0D66
P 8150 1000
F 0 "R1" H 8220 1046 50  0000 L CNN
F 1 "10K" H 8220 955 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 8080 1000 50  0001 C CNN
F 3 "~" H 8150 1000 50  0001 C CNN
	1    8150 1000
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 5E2B6664
P 8150 1300
F 0 "R2" H 8220 1346 50  0000 L CNN
F 1 "10K" H 8220 1255 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 8080 1300 50  0001 C CNN
F 3 "~" H 8150 1300 50  0001 C CNN
	1    8150 1300
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5E2B8057
P 8150 1650
F 0 "R3" H 8220 1696 50  0000 L CNN
F 1 "15K" H 8220 1605 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 8080 1650 50  0001 C CNN
F 3 "~" H 8150 1650 50  0001 C CNN
	1    8150 1650
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 5E2BA48E
P 8150 2000
F 0 "R4" H 8220 2046 50  0000 L CNN
F 1 "15K" H 8220 1955 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 8080 2000 50  0001 C CNN
F 3 "~" H 8150 2000 50  0001 C CNN
	1    8150 2000
	0    1    1    0   
$EndComp
$Comp
L PJRAN2X1U01AUX:PJRAN2X1U01AUX J1
U 2 1 5E2E321B
P 9900 1100
F 0 "J1" H 9645 1130 50  0000 R CNN
F 1 "PJRAN2X1U01AUX" H 9645 1039 50  0000 R CNN
F 2 "SWITCHCRAFT_PJRAN2X1U01AUX" H 9900 1100 50  0001 L BNN
F 3 "Switchcraft" H 9900 1100 50  0001 L BNN
F 4 "None" H 9900 1100 50  0001 L BNN "Field4"
F 5 "3.20mm ID, 9.00mm OD _RCA_ Phono _RCA_ Jack Mono Connector Solder" H 9900 1100 50  0001 L BNN "Field5"
F 6 "PJRAN2X1U01X" H 9900 1100 50  0001 L BNN "Field6"
F 7 "None" H 9900 1100 50  0001 L BNN "Field7"
F 8 "Unavailable" H 9900 1100 50  0001 L BNN "Field8"
	2    9900 1100
	-1   0    0    -1  
$EndComp
$Comp
L Audio:AY-3-8912 U2
U 1 1 5E28F797
P 6250 5800
F 0 "U2" H 6250 7481 50  0000 C CNN
F 1 "AY-3-8912" H 6250 7390 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_LongPads" H 6250 6200 50  0001 C CNN
F 3 "http://map.grauw.nl/resources/sound/generalinstrument_ay-3-8910.pdf" H 6250 6200 50  0001 C CNN
	1    6250 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	600  1600 600  4550
Wire Wire Line
	700  1700 700  4650
Wire Wire Line
	800  1800 800  4750
Wire Wire Line
	900  2000 900  4850
Wire Wire Line
	1000 2100 1000 4950
Wire Wire Line
	1100 2200 1100 5050
Wire Wire Line
	1200 2500 1200 5150
$Comp
L power:GND #PWR0101
U 1 1 5E2EB0F4
P 6250 3000
F 0 "#PWR0101" H 6250 2750 50  0001 C CNN
F 1 "GND" H 6255 2827 50  0000 C CNN
F 2 "" H 6250 3000 50  0001 C CNN
F 3 "" H 6250 3000 50  0001 C CNN
	1    6250 3000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5E2EF47F
P 6250 6450
F 0 "#PWR0102" H 6250 6200 50  0001 C CNN
F 1 "GND" H 6255 6277 50  0000 C CNN
F 2 "" H 6250 6450 50  0001 C CNN
F 3 "" H 6250 6450 50  0001 C CNN
	1    6250 6450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5E2F0DE7
P 9700 1900
F 0 "#PWR0103" H 9700 1650 50  0001 C CNN
F 1 "GND" H 9705 1727 50  0000 C CNN
F 2 "" H 9700 1900 50  0001 C CNN
F 3 "" H 9700 1900 50  0001 C CNN
	1    9700 1900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5E2F1929
P 9700 1200
F 0 "#PWR0104" H 9700 950 50  0001 C CNN
F 1 "GND" H 9705 1027 50  0000 C CNN
F 2 "" H 9700 1200 50  0001 C CNN
F 3 "" H 9700 1200 50  0001 C CNN
	1    9700 1200
	1    0    0    -1  
$EndComp
$Comp
L PJRAN2X1U01AUX:PJRAN2X1U01AUX J1
U 1 1 5E2D8627
P 9900 1800
F 0 "J1" H 9550 1850 50  0000 C CNN
F 1 "PJRAN2X1U01AUX" H 9300 1750 50  0000 C CNN
F 2 "SWITCHCRAFT_PJRAN2X1U01AUX" H 9900 1800 50  0001 L BNN
F 3 "Switchcraft" H 9900 1800 50  0001 L BNN
F 4 "None" H 9900 1800 50  0001 L BNN "Field4"
F 5 "3.20mm ID, 9.00mm OD _RCA_ Phono _RCA_ Jack Mono Connector Solder" H 9900 1800 50  0001 L BNN "Field5"
F 6 "PJRAN2X1U01X" H 9900 1800 50  0001 L BNN "Field6"
F 7 "None" H 9900 1800 50  0001 L BNN "Field7"
F 8 "Unavailable" H 9900 1800 50  0001 L BNN "Field8"
	1    9900 1800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8300 1000 8800 1000
Wire Wire Line
	6950 1150 7450 1150
Wire Wire Line
	7450 1150 7450 1000
Wire Wire Line
	7450 1000 8000 1000
Wire Wire Line
	6950 1250 7450 1250
Wire Wire Line
	7450 1250 7450 1300
Wire Wire Line
	7450 1300 8000 1300
Wire Wire Line
	8300 1300 9000 1300
Wire Wire Line
	9000 1300 9000 1700
Wire Wire Line
	6950 1350 7350 1350
Wire Wire Line
	7350 1350 7350 1650
Wire Wire Line
	7350 1650 8000 1650
Wire Wire Line
	7350 1650 7350 2000
Wire Wire Line
	7350 2000 8000 2000
Connection ~ 7350 1650
Wire Wire Line
	8300 1650 8800 1650
Wire Wire Line
	8800 1650 8800 1000
Connection ~ 8800 1000
Wire Wire Line
	8800 1000 9700 1000
Wire Wire Line
	8300 2000 9000 2000
Wire Wire Line
	9000 2000 9000 1700
Connection ~ 9000 1700
Wire Wire Line
	9000 1700 9700 1700
$Comp
L Device:R R5
U 1 1 5E36D863
P 8150 4600
F 0 "R5" H 8220 4646 50  0000 L CNN
F 1 "10K" H 8220 4555 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 8080 4600 50  0001 C CNN
F 3 "~" H 8150 4600 50  0001 C CNN
	1    8150 4600
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 5E36D869
P 8150 4900
F 0 "R6" H 8220 4946 50  0000 L CNN
F 1 "10K" H 8220 4855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 8080 4900 50  0001 C CNN
F 3 "~" H 8150 4900 50  0001 C CNN
	1    8150 4900
	0    1    1    0   
$EndComp
$Comp
L Device:R R7
U 1 1 5E36D86F
P 8150 5250
F 0 "R7" H 8220 5296 50  0000 L CNN
F 1 "15K" H 8220 5205 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 8080 5250 50  0001 C CNN
F 3 "~" H 8150 5250 50  0001 C CNN
	1    8150 5250
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 5E36D875
P 8150 5600
F 0 "R8" H 8220 5646 50  0000 L CNN
F 1 "15K" H 8220 5555 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 8080 5600 50  0001 C CNN
F 3 "~" H 8150 5600 50  0001 C CNN
	1    8150 5600
	0    1    1    0   
$EndComp
Wire Wire Line
	6950 4600 8000 4600
Wire Wire Line
	8800 1650 8800 4600
Wire Wire Line
	8800 4600 8300 4600
Connection ~ 8800 1650
Wire Wire Line
	6950 4700 7550 4700
Wire Wire Line
	7550 4700 7550 4900
Wire Wire Line
	7550 4900 8000 4900
Connection ~ 9000 2000
Wire Wire Line
	9000 2000 9000 4900
Wire Wire Line
	8300 4900 9000 4900
Wire Wire Line
	6950 4800 7400 4800
Wire Wire Line
	7400 4800 7400 5250
Wire Wire Line
	7400 5600 8000 5600
Wire Wire Line
	8000 5250 7400 5250
Connection ~ 7400 5250
Wire Wire Line
	7400 5250 7400 5600
Wire Wire Line
	8800 4600 8800 5250
Wire Wire Line
	8800 5250 8300 5250
Connection ~ 8800 4600
Wire Wire Line
	8300 5600 9000 5600
Wire Wire Line
	9000 5600 9000 4900
Connection ~ 9000 4900
Wire Wire Line
	600  4550 5450 4550
Wire Wire Line
	700  4650 5350 4650
Wire Wire Line
	800  4750 5250 4750
Wire Wire Line
	900  4850 5150 4850
Wire Wire Line
	1000 4950 5050 4950
Wire Wire Line
	1200 5150 4850 5150
Wire Wire Line
	5550 1100 5450 1100
Wire Wire Line
	5450 1100 5450 4550
Connection ~ 5450 4550
Wire Wire Line
	5450 4550 5550 4550
Wire Wire Line
	5550 1200 5350 1200
Wire Wire Line
	5350 1200 5350 4650
Connection ~ 5350 4650
Wire Wire Line
	5350 4650 5550 4650
Wire Wire Line
	5550 1300 5250 1300
Wire Wire Line
	5250 1300 5250 4750
Connection ~ 5250 4750
Wire Wire Line
	5250 4750 5550 4750
Wire Wire Line
	5550 1400 5150 1400
Wire Wire Line
	5150 1400 5150 4850
Connection ~ 5150 4850
Wire Wire Line
	5150 4850 5550 4850
Wire Wire Line
	5550 1500 5050 1500
Wire Wire Line
	5050 1500 5050 4950
Connection ~ 5050 4950
Wire Wire Line
	5050 4950 5550 4950
Text Label 4400 3000 2    50   ~ 0
GPIO21(SPI1_SCK)
Wire Wire Line
	3350 3000 3650 3000
Text Label 4400 1400 2    50   ~ 0
GPIO14(TXD0)
Text Label 4400 1500 2    50   ~ 0
GPIO15(RXD0)
Text Label 4400 1600 2    50   ~ 0
GPIO18(GEN1)(PWM0)
Text Label 4400 1800 2    50   ~ 0
GPIO23(GEN4)
Text Label 4400 1900 2    50   ~ 0
GPIO24(GEN5)
Text Label 4400 2100 2    50   ~ 0
GPIO25(GEN6)
Text Label 4400 2200 2    50   ~ 0
GPIO8(SPI0_CE_N)
Text Label 4400 2300 2    50   ~ 0
GPIO7(SPI1_CE_N)
Text Label 4400 2400 2    50   ~ 0
ID_SC
Text Label 4400 2600 2    50   ~ 0
GPIO12(PWM0)
Text Label 4400 2800 2    50   ~ 0
GPIO16
Text Label 4400 2900 2    50   ~ 0
GPIO20(SPI1_MOSI)
Wire Wire Line
	3350 2600 4400 2600
Wire Wire Line
	3350 1400 4400 1400
Wire Wire Line
	3350 1600 4400 1600
Wire Wire Line
	3350 1500 4400 1500
Wire Wire Line
	3350 1900 4400 1900
Wire Wire Line
	3350 1800 4400 1800
Wire Wire Line
	3350 2200 4400 2200
Wire Wire Line
	3350 2100 4400 2100
Wire Wire Line
	3350 2400 4400 2400
Wire Wire Line
	3350 2300 4400 2300
Wire Wire Line
	3350 2900 3550 2900
Wire Wire Line
	3350 2800 4400 2800
Text Label 1700 2900 0    50   ~ 0
GPIO26
Text Label 1700 2800 0    50   ~ 0
GPIO19(SPI1_MISO)
Text Label 1700 2700 0    50   ~ 0
GPIO13(PWM1)
Text Label 1700 2600 0    50   ~ 0
GPIO6
Text Label 1700 2500 0    50   ~ 0
GPIO5
Text Label 1700 2400 0    50   ~ 0
ID_SD
Text Label 1700 2200 0    50   ~ 0
GPIO11(SPI0_SCK)
Text Label 1700 2100 0    50   ~ 0
GPIO9(SPI0_MISO)
Text Label 1700 2000 0    50   ~ 0
GPIO10(SPI0_MOSI)
Text Label 1700 1800 0    50   ~ 0
GPIO22(GEN3)
Text Label 1700 1700 0    50   ~ 0
GPIO27(GEN2)
Text Label 1700 1600 0    50   ~ 0
GPIO17(GEN0)
Text Label 1700 1400 0    50   ~ 0
GPIO4(GCLK)
Text Label 1700 1300 0    50   ~ 0
GPIO3(SCL1)
Text Label 1700 1200 0    50   ~ 0
GPIO2(SDA1)
Wire Wire Line
	1700 2900 2850 2900
Wire Wire Line
	2850 2400 1700 2400
Wire Wire Line
	1700 1300 2850 1300
Wire Wire Line
	2850 1200 1700 1200
Wire Wire Line
	5550 1600 4950 1600
Wire Wire Line
	4950 1600 4950 5050
Wire Wire Line
	1100 5050 4950 5050
Wire Wire Line
	4950 5050 5550 5050
Connection ~ 4950 5050
Wire Wire Line
	600  1600 2850 1600
Wire Wire Line
	700  1700 2850 1700
Wire Wire Line
	800  1800 2850 1800
Wire Wire Line
	900  2000 2850 2000
Wire Wire Line
	1000 2100 2850 2100
Wire Wire Line
	1100 2200 2850 2200
Wire Wire Line
	1200 2500 2850 2500
Wire Wire Line
	5550 1700 4850 1700
Wire Wire Line
	4850 1700 4850 5150
Connection ~ 4850 5150
Wire Wire Line
	4850 5150 5550 5150
Wire Wire Line
	5550 1800 4750 1800
Wire Wire Line
	4750 1800 4750 5250
Wire Wire Line
	4750 5250 5550 5250
Wire Wire Line
	4750 5250 1300 5250
Wire Wire Line
	1300 5250 1300 2600
Connection ~ 4750 5250
Wire Wire Line
	1300 2600 2850 2600
$Comp
L power:+5V #PWR0105
U 1 1 5E4A79FA
P 6250 850
F 0 "#PWR0105" H 6250 700 50  0001 C CNN
F 1 "+5V" H 6265 1023 50  0000 C CNN
F 2 "" H 6250 850 50  0001 C CNN
F 3 "" H 6250 850 50  0001 C CNN
	1    6250 850 
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0106
U 1 1 5E4A87A2
P 6250 4300
F 0 "#PWR0106" H 6250 4150 50  0001 C CNN
F 1 "+5V" H 6265 4473 50  0000 C CNN
F 2 "" H 6250 4300 50  0001 C CNN
F 3 "" H 6250 4300 50  0001 C CNN
	1    6250 4300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0107
U 1 1 5E4AF542
P 5350 5650
F 0 "#PWR0107" H 5350 5500 50  0001 C CNN
F 1 "+5V" H 5365 5823 50  0000 C CNN
F 2 "" H 5350 5650 50  0001 C CNN
F 3 "" H 5350 5650 50  0001 C CNN
	1    5350 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 5650 5550 5650
$Comp
L power:+5V #PWR0108
U 1 1 5E4BC608
P 5500 2050
F 0 "#PWR0108" H 5500 1900 50  0001 C CNN
F 1 "+5V" H 5515 2223 50  0000 C CNN
F 2 "" H 5500 2050 50  0001 C CNN
F 3 "" H 5500 2050 50  0001 C CNN
	1    5500 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 6050 5350 6050
Wire Wire Line
	5350 6050 5350 5650
Connection ~ 5350 5650
Wire Wire Line
	5500 2050 5500 2200
Wire Wire Line
	5500 2200 5550 2200
Wire Wire Line
	5500 2200 5500 2600
Wire Wire Line
	5500 2600 5550 2600
Connection ~ 5500 2200
Wire Wire Line
	1550 1400 1550 6150
Wire Wire Line
	1550 6150 4550 6150
Wire Wire Line
	5550 2700 4550 2700
Wire Wire Line
	4550 2700 4550 6150
Connection ~ 4550 6150
Wire Wire Line
	4550 6150 5550 6150
Wire Wire Line
	1550 1400 2850 1400
Wire Wire Line
	1400 2700 1400 3500
Wire Wire Line
	1400 3500 4500 3500
Wire Wire Line
	4500 3500 4500 2100
Wire Wire Line
	4500 2100 5550 2100
Wire Wire Line
	1400 2700 2850 2700
Wire Wire Line
	1450 2800 1450 3600
Wire Wire Line
	1450 3600 4650 3600
Wire Wire Line
	4650 3600 4650 2300
Wire Wire Line
	4650 2300 5550 2300
Wire Wire Line
	1450 2800 2850 2800
Wire Wire Line
	3550 2900 3550 5550
Wire Wire Line
	3550 5550 5550 5550
Connection ~ 3550 2900
Wire Wire Line
	3550 2900 4400 2900
Wire Wire Line
	3650 3000 3650 5750
Wire Wire Line
	3650 5750 5550 5750
Connection ~ 3650 3000
Wire Wire Line
	3650 3000 4400 3000
$EndSCHEMATC
