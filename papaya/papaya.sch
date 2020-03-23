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
P 3100 950
F 0 "#PWR01" H 3100 800 50  0001 C CNN
F 1 "+5V" H 3100 1090 50  0000 C CNN
F 2 "" H 3100 950 50  0000 C CNN
F 3 "" H 3100 950 50  0000 C CNN
	1    3100 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 950  3100 1100
Wire Wire Line
	3100 1100 2900 1100
Wire Wire Line
	3100 1200 2900 1200
Connection ~ 3100 1100
$Comp
L power:GND #PWR02
U 1 1 580C1D11
P 3000 3150
F 0 "#PWR02" H 3000 2900 50  0001 C CNN
F 1 "GND" H 3000 3000 50  0000 C CNN
F 2 "" H 3000 3150 50  0000 C CNN
F 3 "" H 3000 3150 50  0000 C CNN
	1    3000 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 1300 3000 1700
Wire Wire Line
	3000 2700 2900 2700
Wire Wire Line
	3000 2500 2900 2500
Connection ~ 3000 2700
Wire Wire Line
	3000 2000 2900 2000
Connection ~ 3000 2500
Wire Wire Line
	3000 1700 2900 1700
Connection ~ 3000 2000
$Comp
L power:GND #PWR03
U 1 1 580C1E01
P 2300 3150
F 0 "#PWR03" H 2300 2900 50  0001 C CNN
F 1 "GND" H 2300 3000 50  0000 C CNN
F 2 "" H 2300 3150 50  0000 C CNN
F 3 "" H 2300 3150 50  0000 C CNN
	1    2300 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 3000 2400 3000
Wire Wire Line
	2300 1500 2300 2300
Wire Wire Line
	2300 2300 2400 2300
Connection ~ 2300 3000
Connection ~ 2200 1100
Wire Wire Line
	2200 1900 2400 1900
Wire Wire Line
	2200 1100 2400 1100
Wire Wire Line
	2200 950  2200 1100
$Comp
L power:+3.3V #PWR04
U 1 1 580C1BC1
P 2200 950
F 0 "#PWR04" H 2200 800 50  0001 C CNN
F 1 "+3.3V" H 2200 1090 50  0000 C CNN
F 2 "" H 2200 950 50  0000 C CNN
F 3 "" H 2200 950 50  0000 C CNN
	1    2200 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 1500 2400 1500
Connection ~ 2300 2300
Wire Wire Line
	2400 1200 1250 1200
Wire Wire Line
	1250 1300 2400 1300
Wire Wire Line
	1250 1400 1850 1400
Wire Wire Line
	2400 1600 1850 1600
Wire Wire Line
	1250 1700 1850 1700
Wire Wire Line
	1250 1800 1850 1800
Wire Wire Line
	2400 2000 1850 2000
Wire Wire Line
	1250 2100 1850 2100
Wire Wire Line
	1250 2200 1850 2200
Wire Wire Line
	2400 2400 1250 2400
Wire Wire Line
	1250 2500 1850 2500
Wire Wire Line
	1250 2600 1850 2600
Wire Wire Line
	2400 2700 1850 2700
Wire Wire Line
	1250 2800 1850 2800
Wire Wire Line
	1250 2900 2400 2900
Wire Wire Line
	2900 2800 3950 2800
Wire Wire Line
	2900 2900 3950 2900
Wire Wire Line
	2900 2300 3950 2300
Wire Wire Line
	2900 2400 3950 2400
Wire Wire Line
	2900 2100 3950 2100
Wire Wire Line
	2900 2200 3950 2200
Wire Wire Line
	2900 1800 3950 1800
Wire Wire Line
	2900 1900 3950 1900
Wire Wire Line
	2900 1500 3950 1500
Wire Wire Line
	2900 1600 3950 1600
Wire Wire Line
	2900 1400 3950 1400
Wire Wire Line
	2900 2600 3950 2600
Text Label 1250 1200 0    50   ~ 0
GPIO2(SDA1)
Text Label 1250 1300 0    50   ~ 0
GPIO3(SCL1)
Text Label 1250 1400 0    50   ~ 0
GPIO4(GCLK)
Text Label 1250 1600 0    50   ~ 0
GPIO17(GEN0)
Text Label 1250 1700 0    50   ~ 0
GPIO27(GEN2)
Text Label 1250 1800 0    50   ~ 0
GPIO22(GEN3)
Text Label 1250 2000 0    50   ~ 0
GPIO10(SPI0_MOSI)
Text Label 1250 2100 0    50   ~ 0
GPIO9(SPI0_MISO)
Text Label 1250 2200 0    50   ~ 0
GPIO11(SPI0_SCK)
Text Label 1250 2400 0    50   ~ 0
ID_SD
Text Label 1250 2500 0    50   ~ 0
GPIO5
Text Label 1250 2600 0    50   ~ 0
GPIO6
Text Label 1250 2700 0    50   ~ 0
GPIO13(PWM1)
Text Label 1250 2800 0    50   ~ 0
GPIO19(SPI1_MISO)
Text Label 1250 2900 0    50   ~ 0
GPIO26
Text Label 3950 2900 2    50   ~ 0
GPIO20(SPI1_MOSI)
Text Label 3950 2800 2    50   ~ 0
GPIO16
Text Label 3950 2600 2    50   ~ 0
GPIO12(PWM0)
Text Label 3950 2400 2    50   ~ 0
ID_SC
Text Label 3950 2300 2    50   ~ 0
GPIO7(SPI1_CE_N)
Text Label 3950 2200 2    50   ~ 0
GPIO8(SPI0_CE_N)
Text Label 3950 2100 2    50   ~ 0
GPIO25(GEN6)
Text Label 3950 1900 2    50   ~ 0
GPIO24(GEN5)
Text Label 3950 1800 2    50   ~ 0
GPIO23(GEN4)
Text Label 3950 1600 2    50   ~ 0
GPIO18(GEN1)(PWM0)
Text Label 3950 1500 2    50   ~ 0
GPIO15(RXD0)
Text Label 3950 1400 2    50   ~ 0
GPIO14(TXD0)
Wire Wire Line
	3000 1300 2900 1300
Connection ~ 3000 1700
Text Notes 650  7600 0    50   ~ 0
ID_SD and ID_SC PINS:\nThese pins are reserved for HAT ID EEPROM.\n\nAt boot time this I2C interface will be\ninterrogated to look for an EEPROM\nthat identifes the attached board and\nallows automagic setup of the GPIOs\n(and optionally, Linux drivers).\n\nDO NOT USE these pins for anything other\nthan attaching an I2C ID EEPROM. Leave\nunconnected if ID EEPROM not required.
$Comp
L papaya-rescue:Mounting_Hole-Mechanical-papaya-rescue MK1
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
L papaya-rescue:Mounting_Hole-Mechanical-papaya-rescue MK3
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
L papaya-rescue:Mounting_Hole-Mechanical-papaya-rescue MK2
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
L papaya-rescue:Mounting_Hole-Mechanical-papaya-rescue MK4
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
P 2600 2000
F 0 "P1" H 2650 3117 50  0000 C CNN
F 1 "Conn_02x20_Odd_Even" H 2650 3026 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x20_P2.54mm_Vertical" H -2250 1050 50  0001 C CNN
F 3 "" H -2250 1050 50  0001 C CNN
	1    2600 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 3000 3950 3000
Text Label 3950 3000 2    50   ~ 0
GPIO21(SPI1_SCK)
Wire Wire Line
	3100 1100 3100 1200
Wire Wire Line
	3000 2700 3000 3150
Wire Wire Line
	3000 2500 3000 2700
Wire Wire Line
	3000 2000 3000 2500
Wire Wire Line
	2300 3000 2300 3150
Wire Wire Line
	2200 1100 2200 1900
Wire Wire Line
	2300 2300 2300 3000
Wire Wire Line
	3000 1700 3000 2000
$Comp
L papaya-rescue:AY-3-8912-Audio U1
U 1 1 5E2806BC
P 5600 2350
F 0 "U1" H 5600 4031 50  0000 C CNN
F 1 "AY-3-8912" H 5600 3940 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_LongPads" H 5600 2750 50  0001 C CNN
F 3 "http://map.grauw.nl/resources/sound/generalinstrument_ay-3-8910.pdf" H 5600 2750 50  0001 C CNN
	1    5600 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 850  3100 1100
Wire Wire Line
	5600 3850 3000 3150
Connection ~ 3000 3150
Wire Wire Line
	4900 2200 3100 1100
Wire Wire Line
	4900 2600 3100 1100
Wire Wire Line
	4900 2700 1850 1400
Connection ~ 1850 1400
Wire Wire Line
	1850 1400 2400 1400
Wire Wire Line
	4900 1100 1850 1600
Connection ~ 1850 1600
Wire Wire Line
	1850 1600 1250 1600
Wire Wire Line
	4900 1200 1850 1700
Connection ~ 1850 1700
Wire Wire Line
	1850 1700 2400 1700
Wire Wire Line
	4900 1300 1850 1800
Connection ~ 1850 1800
Wire Wire Line
	1850 1800 2400 1800
Wire Wire Line
	4900 1400 1850 2000
Connection ~ 1850 2000
Wire Wire Line
	1850 2000 1250 2000
Wire Wire Line
	4900 1500 1850 2100
Connection ~ 1850 2100
Wire Wire Line
	1850 2100 2400 2100
Wire Wire Line
	4900 1600 1850 2200
Connection ~ 1850 2200
Wire Wire Line
	1850 2200 2400 2200
Wire Wire Line
	4900 1700 1850 2500
Connection ~ 1850 2500
Wire Wire Line
	1850 2500 2400 2500
Wire Wire Line
	4900 1800 1850 2600
Connection ~ 1850 2600
Wire Wire Line
	1850 2600 2400 2600
Wire Wire Line
	4900 2100 1850 2700
Connection ~ 1850 2700
Wire Wire Line
	1850 2700 1250 2700
Wire Wire Line
	4900 2300 1850 2800
Connection ~ 1850 2800
Wire Wire Line
	1850 2800 2400 2800
$Comp
L Device:R R1
U 1 1 5E2B0D66
P 6950 1150
F 0 "R1" H 7020 1196 50  0000 L CNN
F 1 "10K" H 7020 1105 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6880 1150 50  0001 C CNN
F 3 "~" H 6950 1150 50  0001 C CNN
	1    6950 1150
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 5E2B6664
P 6950 1450
F 0 "R2" H 7020 1496 50  0000 L CNN
F 1 "10K" H 7020 1405 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6880 1450 50  0001 C CNN
F 3 "~" H 6950 1450 50  0001 C CNN
	1    6950 1450
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5E2B8057
P 6950 1800
F 0 "R3" H 7020 1846 50  0000 L CNN
F 1 "15K" H 7020 1755 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6880 1800 50  0001 C CNN
F 3 "~" H 6950 1800 50  0001 C CNN
	1    6950 1800
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 5E2BA48E
P 6950 2100
F 0 "R4" H 7020 2146 50  0000 L CNN
F 1 "15K" H 7020 2055 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6880 2100 50  0001 C CNN
F 3 "~" H 6950 2100 50  0001 C CNN
	1    6950 2100
	0    1    1    0   
$EndComp
Wire Wire Line
	6300 1150 6800 1150
Wire Wire Line
	7100 1150 7500 1150
Wire Wire Line
	6300 1250 6800 1450
Wire Wire Line
	7100 1450 7600 1350
Wire Wire Line
	6300 1350 6800 1800
Wire Wire Line
	6300 1350 6800 2100
Connection ~ 6300 1350
Wire Wire Line
	7100 1800 7500 1150
Wire Wire Line
	7100 2100 7600 1350
$Comp
L PJRAN2X1U01AUX:PJRAN2X1U01AUX J1
U 1 1 5E2D8627
P 8350 1600
F 0 "J1" H 8344 1881 50  0000 C CNN
F 1 "PJRAN2X1U01AUX" H 8344 1790 50  0000 C CNN
F 2 "SWITCHCRAFT_PJRAN2X1U01AUX" H 8350 1600 50  0001 L BNN
F 3 "Switchcraft" H 8350 1600 50  0001 L BNN
F 4 "None" H 8350 1600 50  0001 L BNN "Field4"
F 5 "3.20mm ID, 9.00mm OD _RCA_ Phono _RCA_ Jack Mono Connector Solder" H 8350 1600 50  0001 L BNN "Field5"
F 6 "PJRAN2X1U01X" H 8350 1600 50  0001 L BNN "Field6"
F 7 "None" H 8350 1600 50  0001 L BNN "Field7"
F 8 "Unavailable" H 8350 1600 50  0001 L BNN "Field8"
	1    8350 1600
	-1   0    0    -1  
$EndComp
$Comp
L PJRAN2X1U01AUX:PJRAN2X1U01AUX J1
U 2 1 5E2E321B
P 8350 1100
F 0 "J1" H 8095 1130 50  0000 R CNN
F 1 "PJRAN2X1U01AUX" H 8095 1039 50  0000 R CNN
F 2 "SWITCHCRAFT_PJRAN2X1U01AUX" H 8350 1100 50  0001 L BNN
F 3 "Switchcraft" H 8350 1100 50  0001 L BNN
F 4 "None" H 8350 1100 50  0001 L BNN "Field4"
F 5 "3.20mm ID, 9.00mm OD _RCA_ Phono _RCA_ Jack Mono Connector Solder" H 8350 1100 50  0001 L BNN "Field5"
F 6 "PJRAN2X1U01X" H 8350 1100 50  0001 L BNN "Field6"
F 7 "None" H 8350 1100 50  0001 L BNN "Field7"
F 8 "Unavailable" H 8350 1100 50  0001 L BNN "Field8"
	2    8350 1100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5600 3850 8150 1700
Connection ~ 5600 3850
Wire Wire Line
	5600 3850 8150 1200
Wire Wire Line
	7500 1150 8150 1000
Connection ~ 7500 1150
Wire Wire Line
	7600 1350 8150 1500
Connection ~ 7600 1350
$EndSCHEMATC
