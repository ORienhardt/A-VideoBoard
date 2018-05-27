EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:components
LIBS:c64converter-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CONN_02X10 GPIO1
U 1 1 5B0ADE07
P 1600 2550
F 0 "GPIO1" H 1600 3100 50  0000 C CNN
F 1 "CONN_02X10" V 1600 2550 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x10_Pitch2.54mm" H 1600 1350 50  0001 C CNN
F 3 "" H 1600 1350 50  0000 C CNN
	1    1600 2550
	1    0    0    -1  
$EndComp
$Comp
L THS7316 U5
U 1 1 5B0AE2DC
P 7250 3000
F 0 "U5" H 7100 2900 60  0000 C CNN
F 1 "THS7316" H 7250 3000 60  0000 C CNN
F 2 "" H 7250 3000 60  0001 C CNN
F 3 "" H 7250 3000 60  0001 C CNN
	1    7250 3000
	-1   0    0    1   
$EndComp
$Comp
L KC7050A80 OSC1
U 1 1 5B0AE5F3
P 5350 2350
F 0 "OSC1" H 5200 2300 60  0000 C CNN
F 1 "KC7050A80" H 5350 2400 60  0000 C CNN
F 2 "" H 5350 2350 60  0001 C CNN
F 3 "" H 5350 2350 60  0001 C CNN
	1    5350 2350
	0    1    1    0   
$EndComp
$Comp
L APE8865Y5-30-HF-3 U1
U 1 1 5B0AE795
P 2100 5850
F 0 "U1" H 1800 6100 50  0000 C CNN
F 1 "APE8865Y5-30-HF-3" H 2100 6050 50  0000 C CNN
F 2 "" H 2100 5950 50  0000 C CIN
F 3 "" H 2100 5850 50  0000 C CNN
	1    2100 5850
	1    0    0    -1  
$EndComp
$Comp
L APE8865Y5-33-HF-3 U4
U 1 1 5B0AE7FA
P 3650 5850
F 0 "U4" H 3350 6100 50  0000 C CNN
F 1 "APE8865Y5-33-HF-3" H 3650 6050 50  0000 C CNN
F 2 "" H 3650 5950 50  0000 C CIN
F 3 "" H 3650 5850 50  0000 C CNN
	1    3650 5850
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR01
U 1 1 5B0AE9C5
P 4200 5650
F 0 "#PWR01" H 4200 5500 50  0001 C CNN
F 1 "+3.3V" H 4200 5790 50  0000 C CNN
F 2 "" H 4200 5650 50  0000 C CNN
F 3 "" H 4200 5650 50  0000 C CNN
	1    4200 5650
	1    0    0    -1  
$EndComp
NoConn ~ 4100 5950
$Comp
L +5V #PWR02
U 1 1 5B0AEA33
P 3100 5600
F 0 "#PWR02" H 3100 5450 50  0001 C CNN
F 1 "+5V" H 3100 5740 50  0000 C CNN
F 2 "" H 3100 5600 50  0000 C CNN
F 3 "" H 3100 5600 50  0000 C CNN
	1    3100 5600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 5B0AEA5B
P 4200 6600
F 0 "#PWR03" H 4200 6350 50  0001 C CNN
F 1 "GND" H 4200 6450 50  0000 C CNN
F 2 "" H 4200 6600 50  0000 C CNN
F 3 "" H 4200 6600 50  0000 C CNN
	1    4200 6600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 5B0AEAF6
P 2700 6600
F 0 "#PWR04" H 2700 6350 50  0001 C CNN
F 1 "GND" H 2700 6450 50  0000 C CNN
F 2 "" H 2700 6600 50  0000 C CNN
F 3 "" H 2700 6600 50  0000 C CNN
	1    2700 6600
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR05
U 1 1 5B0AEB9E
P 1550 5600
F 0 "#PWR05" H 1550 5450 50  0001 C CNN
F 1 "+5V" H 1550 5740 50  0000 C CNN
F 2 "" H 1550 5600 50  0000 C CNN
F 3 "" H 1550 5600 50  0000 C CNN
	1    1550 5600
	1    0    0    -1  
$EndComp
NoConn ~ 2550 5950
Text Label 2650 5550 0    60   ~ 0
3.0V
$Comp
L C_Small C3
U 1 1 5B0AEC33
P 2700 6350
F 0 "C3" H 2710 6420 50  0000 L CNN
F 1 "10uF" H 2710 6270 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2700 6350 50  0001 C CNN
F 3 "" H 2700 6350 50  0000 C CNN
	1    2700 6350
	1    0    0    -1  
$EndComp
$Comp
L C_Small C4
U 1 1 5B0AF14A
P 4200 6350
F 0 "C4" H 4210 6420 50  0000 L CNN
F 1 "10uF" H 4210 6270 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4200 6350 50  0001 C CNN
F 3 "" H 4200 6350 50  0000 C CNN
	1    4200 6350
	1    0    0    -1  
$EndComp
$Comp
L AD9283BRSZ-80 U2
U 1 1 5B0AF964
P 3350 2300
F 0 "U2" H 3150 2300 60  0000 C CNN
F 1 "AD9283BRSZ-80" H 3450 2400 60  0000 C CNN
F 2 "" H 3350 2300 60  0001 C CNN
F 3 "" H 3350 2300 60  0001 C CNN
	1    3350 2300
	-1   0    0    1   
$EndComp
$Comp
L AD9283BRSZ-80 U3
U 1 1 5B0AFBE9
P 3350 4000
F 0 "U3" H 3150 4000 60  0000 C CNN
F 1 "AD9283BRSZ-80" H 3450 4100 60  0000 C CNN
F 2 "" H 3350 4000 60  0001 C CNN
F 3 "" H 3350 4000 60  0001 C CNN
	1    3350 4000
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR06
U 1 1 5B0B12F8
P 2550 2300
F 0 "#PWR06" H 2550 2050 50  0001 C CNN
F 1 "GND" H 2550 2150 50  0000 C CNN
F 2 "" H 2550 2300 50  0000 C CNN
F 3 "" H 2550 2300 50  0000 C CNN
	1    2550 2300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 5B0B1342
P 2550 4000
F 0 "#PWR07" H 2550 3750 50  0001 C CNN
F 1 "GND" H 2550 3850 50  0000 C CNN
F 2 "" H 2550 4000 50  0000 C CNN
F 3 "" H 2550 4000 50  0000 C CNN
	1    2550 4000
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR08
U 1 1 5B0B185C
P 2300 3350
F 0 "#PWR08" H 2300 3200 50  0001 C CNN
F 1 "+3.3V" H 2300 3490 50  0000 C CNN
F 2 "" H 2300 3350 50  0000 C CNN
F 3 "" H 2300 3350 50  0000 C CNN
	1    2300 3350
	0    -1   -1   0   
$EndComp
$Comp
L +3.3V #PWR09
U 1 1 5B0B1A6C
P 2300 1650
F 0 "#PWR09" H 2300 1500 50  0001 C CNN
F 1 "+3.3V" H 2300 1790 50  0000 C CNN
F 2 "" H 2300 1650 50  0000 C CNN
F 3 "" H 2300 1650 50  0000 C CNN
	1    2300 1650
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR010
U 1 1 5B0B1DCC
P 1100 2850
F 0 "#PWR010" H 1100 2600 50  0001 C CNN
F 1 "GND" H 1100 2700 50  0000 C CNN
F 2 "" H 1100 2850 50  0000 C CNN
F 3 "" H 1100 2850 50  0000 C CNN
	1    1100 2850
	1    0    0    -1  
$EndComp
$Comp
L C_Small C2
U 1 1 5B0B2A53
P 2350 3900
F 0 "C2" H 2360 3970 50  0000 L CNN
F 1 "100nF" H 2360 3820 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 2350 3900 50  0001 C CNN
F 3 "" H 2350 3900 50  0000 C CNN
	1    2350 3900
	0    1    1    0   
$EndComp
$Comp
L C_Small C1
U 1 1 5B0B2E63
P 2350 2200
F 0 "C1" H 2360 2270 50  0000 L CNN
F 1 "100nF" H 2360 2120 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 2350 2200 50  0001 C CNN
F 3 "" H 2350 2200 50  0000 C CNN
	1    2350 2200
	0    1    1    0   
$EndComp
$Comp
L GND #PWR011
U 1 1 5B0B5CC5
P 4100 2300
F 0 "#PWR011" H 4100 2050 50  0001 C CNN
F 1 "GND" H 4100 2150 50  0000 C CNN
F 2 "" H 4100 2300 50  0000 C CNN
F 3 "" H 4100 2300 50  0000 C CNN
	1    4100 2300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR012
U 1 1 5B0B5CEF
P 4100 4000
F 0 "#PWR012" H 4100 3750 50  0001 C CNN
F 1 "GND" H 4100 3850 50  0000 C CNN
F 2 "" H 4100 4000 50  0000 C CNN
F 3 "" H 4100 4000 50  0000 C CNN
	1    4100 4000
	1    0    0    -1  
$EndComp
$Comp
L C_Small C10
U 1 1 5B0B64D0
P 5750 2350
F 0 "C10" H 5760 2420 50  0000 L CNN
F 1 "100nF" H 5760 2270 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 5750 2350 50  0001 C CNN
F 3 "" H 5750 2350 50  0000 C CNN
	1    5750 2350
	-1   0    0    1   
$EndComp
$Comp
L C_Small C7
U 1 1 5B0B6B39
P 4400 1900
F 0 "C7" H 4410 1970 50  0000 L CNN
F 1 "100nF" H 4410 1820 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 4400 1900 50  0001 C CNN
F 3 "" H 4400 1900 50  0000 C CNN
	1    4400 1900
	-1   0    0    1   
$EndComp
$Comp
L C_Small C8
U 1 1 5B0B6F6A
P 4400 3600
F 0 "C8" H 4410 3670 50  0000 L CNN
F 1 "100nF" H 4410 3520 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 4400 3600 50  0001 C CNN
F 3 "" H 4400 3600 50  0000 C CNN
	1    4400 3600
	-1   0    0    1   
$EndComp
Text Label 4450 1400 0    60   ~ 0
3.0V
$Comp
L C_Small C5
U 1 1 5B0B7924
P 4300 1100
F 0 "C5" H 4310 1170 50  0000 L CNN
F 1 "100nF" H 4310 1020 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 4300 1100 50  0001 C CNN
F 3 "" H 4300 1100 50  0000 C CNN
	1    4300 1100
	0    1    1    0   
$EndComp
$Comp
L C_Small C6
U 1 1 5B0B7E30
P 4300 2800
F 0 "C6" H 4310 2870 50  0000 L CNN
F 1 "100nF" H 4310 2720 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 4300 2800 50  0001 C CNN
F 3 "" H 4300 2800 50  0000 C CNN
	1    4300 2800
	0    1    1    0   
$EndComp
Text Label 4500 3100 0    60   ~ 0
3.0V
$Comp
L GND #PWR013
U 1 1 5B0B82A2
P 5150 2900
F 0 "#PWR013" H 5150 2650 50  0001 C CNN
F 1 "GND" H 5150 2750 50  0000 C CNN
F 2 "" H 5150 2900 50  0000 C CNN
F 3 "" H 5150 2900 50  0000 C CNN
	1    5150 2900
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR014
U 1 1 5B0B82D6
P 5150 1850
F 0 "#PWR014" H 5150 1700 50  0001 C CNN
F 1 "+3.3V" H 5150 1990 50  0000 C CNN
F 2 "" H 5150 1850 50  0000 C CNN
F 3 "" H 5150 1850 50  0000 C CNN
	1    5150 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 5800 4200 5800
Wire Wire Line
	4200 5650 4200 6250
Wire Wire Line
	3200 5800 3100 5800
Wire Wire Line
	3100 5800 3100 5600
Wire Wire Line
	3650 6150 3650 6500
Wire Wire Line
	3200 5950 3150 5950
Wire Wire Line
	3150 5950 3150 6200
Connection ~ 4200 5800
Wire Wire Line
	2550 5800 2700 5800
Wire Wire Line
	1650 5950 1650 6200
Wire Wire Line
	1650 6200 2700 6200
Wire Wire Line
	2700 5550 2700 6250
Wire Wire Line
	2100 6150 2100 6500
Wire Wire Line
	3150 6200 4200 6200
Wire Wire Line
	1550 5600 1550 5800
Wire Wire Line
	1550 5800 1650 5800
Connection ~ 2700 5800
Wire Wire Line
	2700 5550 2650 5550
Wire Wire Line
	2700 6450 2700 6600
Connection ~ 2700 6200
Wire Wire Line
	2100 6500 2700 6500
Connection ~ 2700 6500
Connection ~ 4200 6200
Wire Wire Line
	3650 6500 4200 6500
Wire Wire Line
	4200 6450 4200 6600
Connection ~ 4200 6500
Wire Wire Line
	2600 1300 1900 1300
Wire Wire Line
	1900 1300 1900 2100
Wire Wire Line
	1900 2100 1850 2100
Wire Wire Line
	2600 1200 1850 1200
Wire Wire Line
	1850 1200 1850 1900
Wire Wire Line
	1850 1900 1350 1900
Wire Wire Line
	1350 1900 1350 2100
Wire Wire Line
	2600 1400 1950 1400
Wire Wire Line
	1950 1400 1950 2150
Wire Wire Line
	1950 2150 1350 2150
Wire Wire Line
	1350 2150 1350 2200
Wire Wire Line
	2600 1500 2000 1500
Wire Wire Line
	2000 1500 2000 2200
Wire Wire Line
	2000 2200 1850 2200
Wire Wire Line
	2600 1800 2050 1800
Wire Wire Line
	2050 1800 2050 2250
Wire Wire Line
	2050 2250 1350 2250
Wire Wire Line
	1350 2250 1350 2300
Wire Wire Line
	2600 1900 2100 1900
Wire Wire Line
	2100 1900 2100 2300
Wire Wire Line
	2100 2300 1850 2300
Wire Wire Line
	2600 2000 2150 2000
Wire Wire Line
	2150 2000 2150 2350
Wire Wire Line
	2150 2350 1350 2350
Wire Wire Line
	1350 2350 1350 2400
Wire Wire Line
	2600 2100 2200 2100
Wire Wire Line
	2200 2100 2200 2400
Wire Wire Line
	2200 2400 1850 2400
Wire Wire Line
	2600 3800 1900 3800
Wire Wire Line
	1900 3800 1900 3000
Wire Wire Line
	1900 3000 1850 3000
Wire Wire Line
	2600 3700 1950 3700
Wire Wire Line
	1950 3700 1950 2950
Wire Wire Line
	1950 2950 1350 2950
Wire Wire Line
	1350 2950 1350 3000
Wire Wire Line
	2600 3600 2000 3600
Wire Wire Line
	2000 3600 2000 2900
Wire Wire Line
	2000 2900 1850 2900
Wire Wire Line
	2600 3500 2050 3500
Wire Wire Line
	2050 3500 2050 2850
Wire Wire Line
	2050 2850 1350 2850
Wire Wire Line
	1350 2850 1350 2900
Wire Wire Line
	2600 3200 2100 3200
Wire Wire Line
	2100 3200 2100 2800
Wire Wire Line
	2100 2800 1850 2800
Wire Wire Line
	2600 3100 2150 3100
Wire Wire Line
	2150 3100 2150 2750
Wire Wire Line
	2150 2750 1350 2750
Wire Wire Line
	1350 2750 1350 2800
Wire Wire Line
	2600 3000 2200 3000
Wire Wire Line
	2200 3000 2200 2700
Wire Wire Line
	2200 2700 1850 2700
Wire Wire Line
	2600 2900 2250 2900
Wire Wire Line
	2250 2900 2250 2650
Wire Wire Line
	2250 2650 1350 2650
Wire Wire Line
	1350 2650 1350 2700
Wire Wire Line
	3950 1200 3950 2900
Wire Wire Line
	3950 2900 3900 2900
Wire Wire Line
	3950 1200 3900 1200
Wire Wire Line
	2600 3400 2550 3400
Wire Wire Line
	2550 3400 2550 4000
Wire Wire Line
	2350 2550 2350 2500
Wire Wire Line
	2350 2500 1850 2500
Wire Wire Line
	2550 1700 2550 2300
Wire Wire Line
	2550 1700 2600 1700
Wire Wire Line
	2300 3350 2550 3350
Wire Wire Line
	2550 3350 2550 3300
Wire Wire Line
	2550 3300 2600 3300
Wire Wire Line
	2300 1650 2550 1650
Wire Wire Line
	2550 1650 2550 1600
Wire Wire Line
	2550 1600 2600 1600
Wire Wire Line
	1350 2500 1100 2500
Wire Wire Line
	1100 2500 1100 2850
Wire Wire Line
	1350 2600 1100 2600
Connection ~ 1100 2600
Wire Wire Line
	1850 2600 1850 2550
Wire Wire Line
	1850 2550 1100 2550
Connection ~ 1100 2550
Wire Wire Line
	6750 2500 6250 2500
Wire Wire Line
	6250 2500 6250 1500
Wire Wire Line
	6250 1500 3900 1500
Wire Wire Line
	6750 2700 6250 2700
Wire Wire Line
	6250 2700 6250 3200
Wire Wire Line
	6250 3200 3900 3200
Wire Wire Line
	6750 2600 6200 2600
Wire Wire Line
	6200 1600 6200 3300
Wire Wire Line
	6200 1600 3900 1600
Wire Wire Line
	6200 3300 3900 3300
Connection ~ 6200 2600
Wire Wire Line
	2250 3900 2250 3450
Wire Wire Line
	2250 3450 2500 3450
Wire Wire Line
	2500 3450 2500 3350
Connection ~ 2500 3350
Wire Wire Line
	2450 3900 2550 3900
Connection ~ 2550 3900
Wire Wire Line
	2450 2200 2550 2200
Connection ~ 2550 2200
Wire Wire Line
	2250 2200 2250 1750
Wire Wire Line
	2250 1750 2450 1750
Wire Wire Line
	2450 1750 2450 1650
Connection ~ 2450 1650
Wire Wire Line
	4100 2100 3900 2100
Wire Wire Line
	4100 1100 4100 2300
Wire Wire Line
	4100 3800 3900 3800
Wire Wire Line
	4100 2800 4100 4000
Wire Wire Line
	3900 3600 3950 3600
Wire Wire Line
	3950 3600 3950 3700
Wire Wire Line
	3900 3700 4400 3700
Wire Wire Line
	3900 1900 4050 1900
Wire Wire Line
	4050 1900 4050 2000
Wire Wire Line
	3900 2000 4400 2000
Wire Wire Line
	3900 1800 4400 1800
Connection ~ 4050 2000
Connection ~ 4100 2100
Connection ~ 4100 1800
Wire Wire Line
	3900 3500 4400 3500
Connection ~ 4100 3800
Connection ~ 4100 3500
Connection ~ 3950 3700
Wire Wire Line
	3900 3000 4100 3000
Wire Wire Line
	3900 1300 4100 1300
Wire Wire Line
	3900 1400 4450 1400
Wire Wire Line
	4400 1100 4400 1700
Connection ~ 4400 1400
Wire Wire Line
	4100 1100 4200 1100
Connection ~ 4100 1300
Wire Wire Line
	4400 1700 3900 1700
Wire Wire Line
	3900 3100 4500 3100
Wire Wire Line
	4400 2800 4400 3400
Connection ~ 4400 3100
Wire Wire Line
	4400 3400 3900 3400
Wire Wire Line
	4100 2800 4200 2800
Connection ~ 4100 3000
Wire Wire Line
	5050 1900 5750 1900
Wire Wire Line
	5750 1900 5750 2250
Wire Wire Line
	5150 2800 5150 2900
Connection ~ 3950 2550
Connection ~ 5150 1900
Wire Wire Line
	5150 2850 5750 2850
Wire Wire Line
	5750 2850 5750 2450
Connection ~ 5150 2850
Wire Wire Line
	5050 2800 4850 2800
Wire Wire Line
	4850 2800 4850 2550
Wire Wire Line
	4850 2550 2350 2550
$Comp
L GND #PWR015
U 1 1 5B0B902D
P 6700 2850
F 0 "#PWR015" H 6700 2600 50  0001 C CNN
F 1 "GND" H 6700 2700 50  0000 C CNN
F 2 "" H 6700 2850 50  0000 C CNN
F 3 "" H 6700 2850 50  0000 C CNN
	1    6700 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 2000 6700 2850
Wire Wire Line
	6700 2400 6750 2400
Text Label 7750 1900 0    60   ~ 0
3.0V
Wire Wire Line
	7750 2400 7700 2400
Wire Wire Line
	7750 1900 7750 2400
$Comp
L C_Small C11
U 1 1 5B0B920C
P 7250 2000
F 0 "C11" H 7260 2070 50  0000 L CNN
F 1 "100nF" H 7260 1920 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 7250 2000 50  0001 C CNN
F 3 "" H 7250 2000 50  0000 C CNN
	1    7250 2000
	0    1    1    0   
$EndComp
Wire Wire Line
	7350 2000 8650 2000
Connection ~ 7750 2000
Wire Wire Line
	7150 2000 6700 2000
Connection ~ 6700 2400
$Comp
L CONN_02X04 P7
U 1 1 5B0B9FA1
P 10300 2200
F 0 "P7" H 10300 2450 50  0000 C CNN
F 1 "GPIO2" H 10300 1950 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x04_Pitch2.54mm" H 10300 1000 50  0001 C CNN
F 3 "" H 10300 1000 50  0000 C CNN
	1    10300 2200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR016
U 1 1 5B0BA269
P 9950 2500
F 0 "#PWR016" H 9950 2250 50  0001 C CNN
F 1 "GND" H 9950 2350 50  0000 C CNN
F 2 "" H 9950 2500 50  0000 C CNN
F 3 "" H 9950 2500 50  0000 C CNN
	1    9950 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9950 2500 9950 2350
Wire Wire Line
	9950 2350 10050 2350
Wire Wire Line
	10550 2350 10700 2350
NoConn ~ 10550 2250
NoConn ~ 10050 2250
$Comp
L CONN_01X01 P1
U 1 1 5B0BAA33
P 7700 4950
F 0 "P1" H 7700 5050 50  0000 C CNN
F 1 "LUMA" V 7800 4950 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_1mmDrill" H 7700 4950 50  0001 C CNN
F 3 "" H 7700 4950 50  0000 C CNN
	1    7700 4950
	0    1    1    0   
$EndComp
$Comp
L CONN_01X01 P2
U 1 1 5B0BAEE6
P 7700 5650
F 0 "P2" H 7700 5750 50  0000 C CNN
F 1 "LUMA_GND" V 7800 5650 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_1-5mmDrill" H 7700 5650 50  0001 C CNN
F 3 "" H 7700 5650 50  0000 C CNN
	1    7700 5650
	0    1    1    0   
$EndComp
$Comp
L GND #PWR017
U 1 1 5B0BAF59
P 7400 5450
F 0 "#PWR017" H 7400 5200 50  0001 C CNN
F 1 "GND" H 7400 5300 50  0000 C CNN
F 2 "" H 7400 5450 50  0000 C CNN
F 3 "" H 7400 5450 50  0000 C CNN
	1    7400 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 5350 7700 5350
Wire Wire Line
	7700 5350 7700 5450
$Comp
L CONN_01X01 P3
U 1 1 5B0BB301
P 8450 4950
F 0 "P3" H 8450 5050 50  0000 C CNN
F 1 "CHROMA" V 8550 4950 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_1mmDrill" H 8450 4950 50  0001 C CNN
F 3 "" H 8450 4950 50  0000 C CNN
	1    8450 4950
	0    1    1    0   
$EndComp
$Comp
L CONN_01X01 P4
U 1 1 5B0BB307
P 8450 5650
F 0 "P4" H 8450 5750 50  0000 C CNN
F 1 "CHROMA_GND" V 8550 5650 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_1-5mmDrill" H 8450 5650 50  0001 C CNN
F 3 "" H 8450 5650 50  0000 C CNN
	1    8450 5650
	0    1    1    0   
$EndComp
$Comp
L GND #PWR018
U 1 1 5B0BB30D
P 8150 5450
F 0 "#PWR018" H 8150 5200 50  0001 C CNN
F 1 "GND" H 8150 5300 50  0000 C CNN
F 2 "" H 8150 5450 50  0000 C CNN
F 3 "" H 8150 5450 50  0000 C CNN
	1    8150 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 5350 8450 5350
Wire Wire Line
	8450 5350 8450 5450
$Comp
L CONN_01X01 P5
U 1 1 5B0BBA08
P 9150 4950
F 0 "P5" H 9150 5050 50  0000 C CNN
F 1 "VIN" V 9250 4950 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_1mmDrill" H 9150 4950 50  0001 C CNN
F 3 "" H 9150 4950 50  0000 C CNN
	1    9150 4950
	0    1    1    0   
$EndComp
$Comp
L CONN_01X01 P6
U 1 1 5B0BBA0E
P 9150 5650
F 0 "P6" H 9150 5750 50  0000 C CNN
F 1 "VIN_GND" V 9250 5650 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_1-5mmDrill" H 9150 5650 50  0001 C CNN
F 3 "" H 9150 5650 50  0000 C CNN
	1    9150 5650
	0    1    1    0   
$EndComp
$Comp
L GND #PWR019
U 1 1 5B0BBA14
P 8950 5450
F 0 "#PWR019" H 8950 5200 50  0001 C CNN
F 1 "GND" H 8950 5300 50  0000 C CNN
F 2 "" H 8950 5450 50  0000 C CNN
F 3 "" H 8950 5450 50  0000 C CNN
	1    8950 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 5450 8950 5350
Wire Wire Line
	8950 5350 9150 5350
Wire Wire Line
	9150 5350 9150 5450
$Comp
L +5V #PWR020
U 1 1 5B0BBBD5
P 9150 4500
F 0 "#PWR020" H 9150 4350 50  0001 C CNN
F 1 "+5V" H 9150 4640 50  0000 C CNN
F 2 "" H 9150 4500 50  0000 C CNN
F 3 "" H 9150 4500 50  0000 C CNN
	1    9150 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 4500 9150 4750
$Comp
L C_Small C9
U 1 1 5B0BC29B
P 4850 5950
F 0 "C9" H 4860 6020 50  0000 L CNN
F 1 "10uF" H 4860 5870 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4850 5950 50  0001 C CNN
F 3 "" H 4850 5950 50  0000 C CNN
	1    4850 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 4700 10700 4700
Connection ~ 9150 4700
$Comp
L R_Small R7
U 1 1 5B0BED70
P 8650 2800
F 0 "R7" H 8680 2820 50  0000 L CNN
F 1 "1k" H 8680 2760 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 8650 2800 50  0001 C CNN
F 3 "" H 8650 2800 50  0000 C CNN
	1    8650 2800
	1    0    0    -1  
$EndComp
$Comp
L R_Small R6
U 1 1 5B0BEF1C
P 8650 2400
F 0 "R6" H 8680 2420 50  0000 L CNN
F 1 "1k" H 8680 2360 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 8650 2400 50  0001 C CNN
F 3 "" H 8650 2400 50  0000 C CNN
	1    8650 2400
	1    0    0    -1  
$EndComp
$Comp
L R_Small R5
U 1 1 5B0BEF87
P 8650 2150
F 0 "R5" H 8680 2170 50  0000 L CNN
F 1 "10k" H 8680 2110 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 8650 2150 50  0001 C CNN
F 3 "" H 8650 2150 50  0000 C CNN
	1    8650 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 2000 8650 2050
Wire Wire Line
	8650 2250 8650 2300
Wire Wire Line
	8650 2500 8650 2700
$Comp
L GND #PWR021
U 1 1 5B0BF518
P 8650 3100
F 0 "#PWR021" H 8650 2850 50  0001 C CNN
F 1 "GND" H 8650 2950 50  0000 C CNN
F 2 "" H 8650 3100 50  0000 C CNN
F 3 "" H 8650 3100 50  0000 C CNN
	1    8650 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 2900 8650 3100
Wire Wire Line
	7700 2600 8900 2600
Connection ~ 8650 2600
$Comp
L C_Small C14
U 1 1 5B0BF7F8
P 8900 2800
F 0 "C14" H 8910 2870 50  0000 L CNN
F 1 "100nF" H 8910 2720 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 8900 2800 50  0001 C CNN
F 3 "" H 8900 2800 50  0000 C CNN
	1    8900 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 2600 8900 2700
Wire Wire Line
	8900 2900 8900 2950
Wire Wire Line
	8900 2950 8650 2950
Connection ~ 8650 2950
$Comp
L R_Small R2
U 1 1 5B0C0292
P 7700 4500
F 0 "R2" H 7730 4520 50  0000 L CNN
F 1 "37.4" H 7730 4460 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 7700 4500 50  0001 C CNN
F 3 "" H 7700 4500 50  0000 C CNN
	1    7700 4500
	1    0    0    -1  
$EndComp
$Comp
L R_Small R1
U 1 1 5B0C0566
P 7400 4500
F 0 "R1" H 7430 4520 50  0000 L CNN
F 1 "37.4" H 7430 4460 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 7400 4500 50  0001 C CNN
F 3 "" H 7400 4500 50  0000 C CNN
	1    7400 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 4600 7400 5450
Connection ~ 7400 5350
Wire Wire Line
	7400 4400 7400 4350
Wire Wire Line
	7400 4350 7700 4350
Wire Wire Line
	7700 3900 7700 4400
Wire Wire Line
	7700 4600 7700 4750
$Comp
L C_Small C12
U 1 1 5B0C0AAA
P 7700 3800
F 0 "C12" H 7710 3870 50  0000 L CNN
F 1 "100nF" H 7710 3720 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 7700 3800 50  0001 C CNN
F 3 "" H 7700 3800 50  0000 C CNN
	1    7700 3800
	1    0    0    -1  
$EndComp
Connection ~ 7700 4350
Wire Wire Line
	7700 2700 7700 3700
$Comp
L R_Small R4
U 1 1 5B0C10FA
P 8450 4500
F 0 "R4" H 8480 4520 50  0000 L CNN
F 1 "37.4" H 8480 4460 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 8450 4500 50  0001 C CNN
F 3 "" H 8450 4500 50  0000 C CNN
	1    8450 4500
	1    0    0    -1  
$EndComp
$Comp
L R_Small R3
U 1 1 5B0C1100
P 8150 4500
F 0 "R3" H 8180 4520 50  0000 L CNN
F 1 "37.4" H 8180 4460 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 8150 4500 50  0001 C CNN
F 3 "" H 8150 4500 50  0000 C CNN
	1    8150 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 4600 8150 5450
Wire Wire Line
	8150 4400 8150 4350
Wire Wire Line
	8150 4350 8450 4350
Wire Wire Line
	8450 3900 8450 4400
Wire Wire Line
	8450 4600 8450 4750
$Comp
L C_Small C13
U 1 1 5B0C110B
P 8450 3800
F 0 "C13" H 8460 3870 50  0000 L CNN
F 1 "100nF" H 8460 3720 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 8450 3800 50  0001 C CNN
F 3 "" H 8450 3800 50  0000 C CNN
	1    8450 3800
	1    0    0    -1  
$EndComp
Connection ~ 8450 4350
Connection ~ 8150 5350
Wire Wire Line
	8450 3700 8450 2500
Wire Wire Line
	8450 2500 7700 2500
$Comp
L GND #PWR022
U 1 1 5B0C54AD
P 4850 6250
F 0 "#PWR022" H 4850 6000 50  0001 C CNN
F 1 "GND" H 4850 6100 50  0000 C CNN
F 2 "" H 4850 6250 50  0000 C CNN
F 3 "" H 4850 6250 50  0000 C CNN
	1    4850 6250
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR023
U 1 1 5B0C5507
P 4850 5650
F 0 "#PWR023" H 4850 5500 50  0001 C CNN
F 1 "+5V" H 4850 5790 50  0000 C CNN
F 2 "" H 4850 5650 50  0000 C CNN
F 3 "" H 4850 5650 50  0000 C CNN
	1    4850 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 5850 4850 5650
Wire Wire Line
	4850 6250 4850 6050
Connection ~ 10700 2350
Wire Wire Line
	10700 4700 10700 2350
$Comp
L 4_DIP_SWITCH S1
U 1 1 5B0C72B2
P 10350 800
F 0 "S1" H 10200 700 60  0000 C CNN
F 1 "4_DIP_SWITCH" H 10350 800 60  0000 C CNN
F 2 "" H 10350 800 60  0001 C CNN
F 3 "" H 10350 800 60  0001 C CNN
	1    10350 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	10650 1300 10700 1300
Wire Wire Line
	10700 1300 10700 2150
Wire Wire Line
	10700 2150 10550 2150
Wire Wire Line
	10650 1200 10750 1200
Wire Wire Line
	10750 1200 10750 2100
Wire Wire Line
	10750 2100 10000 2100
Wire Wire Line
	10000 2100 10000 2150
Wire Wire Line
	10000 2150 10050 2150
Wire Wire Line
	10650 1100 10800 1100
Wire Wire Line
	10800 1100 10800 2050
Wire Wire Line
	10800 2050 10550 2050
Wire Wire Line
	10650 1000 10850 1000
Wire Wire Line
	10850 1000 10850 1900
Wire Wire Line
	10850 1900 10000 1900
Wire Wire Line
	10000 1900 10000 2050
Wire Wire Line
	10000 2050 10050 2050
$Comp
L GND #PWR024
U 1 1 5B0C79EF
P 9900 1450
F 0 "#PWR024" H 9900 1200 50  0001 C CNN
F 1 "GND" H 9900 1300 50  0000 C CNN
F 2 "" H 9900 1450 50  0000 C CNN
F 3 "" H 9900 1450 50  0000 C CNN
	1    9900 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9900 1000 9900 1450
Wire Wire Line
	9900 1300 9950 1300
Wire Wire Line
	9900 1200 9950 1200
Connection ~ 9900 1300
Wire Wire Line
	9900 1100 9950 1100
Connection ~ 9900 1200
Wire Wire Line
	9900 1000 9950 1000
Connection ~ 9900 1100
$Comp
L PWR_FLAG #FLG025
U 1 1 5B0C8F2F
P 5300 5700
F 0 "#FLG025" H 5300 5795 50  0001 C CNN
F 1 "PWR_FLAG" H 5300 5880 50  0000 C CNN
F 2 "" H 5300 5700 50  0000 C CNN
F 3 "" H 5300 5700 50  0000 C CNN
	1    5300 5700
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG026
U 1 1 5B0C8FAD
P 5300 6250
F 0 "#FLG026" H 5300 6345 50  0001 C CNN
F 1 "PWR_FLAG" H 5300 6430 50  0000 C CNN
F 2 "" H 5300 6250 50  0000 C CNN
F 3 "" H 5300 6250 50  0000 C CNN
	1    5300 6250
	-1   0    0    1   
$EndComp
Wire Wire Line
	4850 5750 5400 5750
Wire Wire Line
	5300 5750 5300 5700
Connection ~ 4850 5750
Wire Wire Line
	4850 6150 5700 6150
Wire Wire Line
	5300 6150 5300 6250
Connection ~ 4850 6150
Wire Wire Line
	5150 1900 5150 1850
$Comp
L Led_Small D1
U 1 1 5B0CA7DF
P 5700 5950
F 0 "D1" H 5650 6075 50  0000 L CNN
F 1 "Power on" H 5525 5850 50  0000 L CNN
F 2 "" V 5700 5950 50  0001 C CNN
F 3 "" V 5700 5950 50  0000 C CNN
	1    5700 5950
	0    -1   -1   0   
$EndComp
$Comp
L R_Small R8
U 1 1 5B0CB0F7
P 5500 5750
F 0 "R8" H 5530 5770 50  0000 L CNN
F 1 "4k8" H 5530 5710 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 5500 5750 50  0001 C CNN
F 3 "" H 5500 5750 50  0000 C CNN
	1    5500 5750
	0    1    1    0   
$EndComp
Connection ~ 5300 5750
Wire Wire Line
	5600 5750 5700 5750
Wire Wire Line
	5700 5750 5700 5850
Wire Wire Line
	5700 6150 5700 6050
Connection ~ 5300 6150
$EndSCHEMATC
