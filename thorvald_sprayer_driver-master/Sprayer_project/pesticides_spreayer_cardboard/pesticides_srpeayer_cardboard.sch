EESchema Schematic File Version 2
LIBS:my_fairchild_semiconductor
LIBS:my_panasonic_2
LIBS:my_molex
LIBS:my_panasonic
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
LIBS:my_murata_power_solutions
LIBS:my_xp_power
LIBS:my_delta
LIBS:my_rs
LIBS:my_pam
LIBS:my_adafruit
LIBS:my_te_connectivity
LIBS:my_knitter_switch
LIBS:my_arduino
LIBS:my_omron
LIBS:INA122PA
LIBS:233-203
LIBS:pesticides_spreayer_cardboard-cache
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
L DB15_FEMALE J4
U 1 1 5975DDB3
P 7300 1500
F 0 "J4" H 7320 2350 50  0000 C CNN
F 1 "DB15_FEMALE" H 7300 625 50  0000 C CNN
F 2 "Connectors:DB15FC" H 7300 1500 50  0001 C CNN
F 3 "" H 7300 1500 50  0001 C CNN
	1    7300 1500
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 5975E06F
P 2100 2850
F 0 "R1" V 2180 2850 50  0000 C CNN
F 1 "R" V 2100 2850 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2030 2850 50  0001 C CNN
F 3 "" H 2100 2850 50  0001 C CNN
	1    2100 2850
	1    0    0    -1  
$EndComp
$Comp
L R R120
U 1 1 5975E118
P 6650 1950
F 0 "R120" V 6730 1950 50  0000 C CNN
F 1 "R" V 6650 1950 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6580 1950 50  0001 C CNN
F 3 "" H 6650 1950 50  0001 C CNN
	1    6650 1950
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR01
U 1 1 5976073A
P 2000 3750
F 0 "#PWR01" H 2000 3500 50  0001 C CNN
F 1 "GND" H 2000 3600 50  0000 C CNN
F 2 "" H 2000 3750 50  0001 C CNN
F 3 "" H 2000 3750 50  0001 C CNN
	1    2000 3750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 59760760
P 1300 3050
F 0 "#PWR02" H 1300 2800 50  0001 C CNN
F 1 "GND" H 1300 2900 50  0000 C CNN
F 2 "" H 1300 3050 50  0001 C CNN
F 3 "" H 1300 3050 50  0001 C CNN
	1    1300 3050
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR03
U 1 1 59760955
P 1500 1200
F 0 "#PWR03" H 1500 1050 50  0001 C CNN
F 1 "VCC" H 1500 1350 50  0000 C CNN
F 2 "" H 1500 1200 50  0001 C CNN
F 3 "" H 1500 1200 50  0001 C CNN
	1    1500 1200
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR04
U 1 1 5976097B
P 1300 1850
F 0 "#PWR04" H 1300 1700 50  0001 C CNN
F 1 "VCC" H 1300 2000 50  0000 C CNN
F 2 "" H 1300 1850 50  0001 C CNN
F 3 "" H 1300 1850 50  0001 C CNN
	1    1300 1850
	1    0    0    -1  
$EndComp
$Comp
L molex_micro-fit_2x4 J3
U 1 1 59761A5D
P 5100 1900
F 0 "J3" H 4800 1900 60  0000 C CNN
F 1 "molex_micro-fit_2x4" H 5100 1500 60  0000 C CNN
F 2 "my_molex:molex_micro-fit_43045-0812" H 5100 1900 60  0001 C CNN
F 3 "" H 5100 1900 60  0001 C CNN
	1    5100 1900
	0    1    1    0   
$EndComp
$Comp
L MFP213N SW1
U 1 1 597622CE
P 6200 1950
F 0 "SW1" H 6200 1450 60  0000 C CNN
F 1 "MFP213N" H 6025 1550 60  0000 C CNN
F 2 "my_knitter_switch:MFP213N_DPDT" H 6100 1950 60  0001 C CNN
F 3 "" H 6100 1950 60  0001 C CNN
	1    6200 1950
	1    0    0    -1  
$EndComp
$Comp
L INA122PA U1
U 1 1 59763089
P 3550 1900
F 0 "U1" H 3339 2659 50  0000 L BNN
F 1 "INA122PA" H 3451 920 50  0000 L BNN
F 2 "INA122PA:DIP254P762X508-8" H 3550 1900 50  0001 L BNN
F 3 "Single Supply%2C MicroPower Instrumentation Amplifier 8-PDIP" H 3550 1900 50  0001 L BNN
F 4 "Texas Instruments" H 3550 1900 50  0001 L BNN "MF"
F 5 "Good" H 3550 1900 50  0001 L BNN "Availability"
F 6 "SOIC-8 Texas Instruments" H 3550 1900 50  0001 L BNN "Package"
F 7 "5.07 USD" H 3550 1900 50  0001 L BNN "Price"
F 8 "INA122PA" H 3550 1900 50  0001 L BNN "MP"
	1    3550 1900
	1    0    0    -1  
$EndComp
$Comp
L 233-203 X1
U 1 1 5977794D
P 1600 2400
F 0 "X1" H 1400 2600 50  0000 L BNN
F 1 "233-203" H 1400 2150 50  0000 L BNN
F 2 "233-203:233-203" H 1600 2400 50  0001 L BNN
F 3 "1.01 USD" H 1600 2400 50  0001 L BNN
F 4 "233-203" H 1600 2400 50  0001 L BNN "MP"
F 5 "Warning" H 1600 2400 50  0001 L BNN "Availability"
F 6 "Spring-loaded terminal 0.50 mm%C2%B2 Number of pins 3 PCB TERM.STR. 3 POL. 2%2C 5 MM GREY WAGO Grey 500 pc%28s%29" H 1600 2400 50  0001 L BNN "Description"
F 7 "WAGO" H 1600 2400 50  0001 L BNN "MF"
F 8 "None" H 1600 2400 50  0001 L BNN "Package"
	1    1600 2400
	1    0    0    -1  
$EndComp
$Comp
L molex_micro-fit_2x1 J1
U 1 1 597786CE
P 6200 3250
F 0 "J1" H 6050 3250 60  0000 C CNN
F 1 "molex_micro-fit_2x1" H 6200 2850 60  0000 C CNN
F 2 "my_molex:molex_micro-fit_43045-0212" H 6200 3250 60  0001 C CNN
F 3 "" H 6200 3250 60  0001 C CNN
	1    6200 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 550  7850 550 
Connection ~ 2000 3400
Wire Wire Line
	1500 1200 1500 1300
Wire Wire Line
	2000 2500 2000 3750
Wire Wire Line
	1300 1850 1300 2300
Wire Wire Line
	1300 2500 1300 3050
Wire Wire Line
	2850 1500 2850 550 
Wire Wire Line
	5450 3250 6000 3250
Wire Wire Line
	6000 3250 6000 2950
Wire Wire Line
	6000 2950 6200 2950
Wire Wire Line
	6200 3550 6000 3550
Wire Wire Line
	6000 3550 6000 3350
Wire Wire Line
	6000 3350 5400 3350
Wire Wire Line
	5400 1750 5800 1750
Wire Wire Line
	5400 1850 5800 1850
Wire Wire Line
	5800 1850 5800 2150
Wire Wire Line
	6500 2250 6650 2250
Wire Wire Line
	6650 2250 6650 2100
Wire Wire Line
	6500 1850 6500 1800
Wire Wire Line
	6500 1800 6650 1800
Wire Wire Line
	6500 1650 6500 1600
Wire Wire Line
	6500 1600 4800 1600
Wire Wire Line
	4800 1600 4800 1750
Wire Wire Line
	6500 2050 6550 2050
Wire Wire Line
	6550 2050 6550 1500
Wire Wire Line
	6550 1500 4600 1500
Wire Wire Line
	4600 1500 4600 1850
Wire Wire Line
	4600 1850 4800 1850
Wire Wire Line
	6800 1800 7000 1800
Connection ~ 5700 1750
Wire Wire Line
	7000 2000 6800 2000
Wire Wire Line
	6800 2000 6800 2400
Wire Wire Line
	6800 2400 5550 2400
Wire Wire Line
	5550 2400 5550 1850
Connection ~ 5550 1850
Wire Wire Line
	5450 3250 5450 1950
Wire Wire Line
	5450 1950 5400 1950
Wire Wire Line
	5400 3350 5400 2050
Wire Wire Line
	6800 1500 7000 1500
Wire Wire Line
	7000 1900 7850 1900
Wire Wire Line
	7850 1900 7850 550 
Wire Wire Line
	6800 1200 6800 1500
$Comp
L LED D1
U 1 1 597A1DD9
P 6350 800
F 0 "D1" H 6350 900 50  0000 C CNN
F 1 "LED" H 6350 700 50  0000 C CNN
F 2 "LEDs:LED_D3.0mm" H 6350 800 50  0001 C CNN
F 3 "" H 6350 800 50  0001 C CNN
	1    6350 800 
	-1   0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 597A1FE3
P 5600 800
F 0 "R5" V 5680 800 50  0000 C CNN
F 1 "R" V 5600 800 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5530 800 50  0001 C CNN
F 3 "" H 5600 800 50  0001 C CNN
	1    5600 800 
	0    1    1    0   
$EndComp
Wire Wire Line
	5300 550  5300 800 
Wire Wire Line
	5300 800  5450 800 
Connection ~ 5300 550 
Wire Wire Line
	5750 800  6200 800 
Wire Wire Line
	6500 800  7000 800 
$Comp
L molex_micro-fit_2x2 J2
U 1 1 597A2E19
P 2050 2200
F 0 "J2" H 1850 2200 60  0000 C CNN
F 1 "molex_micro-fit_2x2" H 2050 1800 60  0000 C CNN
F 2 "my_molex:molex_micro-fit_43045-0412" H 2050 2200 60  0001 C CNN
F 3 "" H 2050 2200 60  0001 C CNN
	1    2050 2200
	-1   0    0    1   
$EndComp
Wire Wire Line
	2000 1900 2000 1300
Wire Wire Line
	2100 2500 2100 2700
Wire Wire Line
	2100 3000 2100 3400
Connection ~ 2100 3400
Wire Wire Line
	2100 2600 2500 2600
Wire Wire Line
	2500 2600 2500 1700
Wire Wire Line
	2500 1700 2850 1700
Connection ~ 2100 2600
Wire Wire Line
	2100 3100 2600 3100
Wire Wire Line
	2600 3100 2600 1800
Wire Wire Line
	2600 1800 2850 1800
Connection ~ 2100 3100
Wire Wire Line
	4250 1200 6800 1200
Wire Wire Line
	5700 1750 5700 1400
Wire Wire Line
	5700 1400 6650 1400
Wire Wire Line
	6650 1400 6650 1700
Wire Wire Line
	6650 1700 6800 1700
Wire Wire Line
	6800 1700 6800 1800
Wire Wire Line
	2700 2450 2650 2450
Wire Wire Line
	2650 2450 2650 2000
Wire Wire Line
	2650 2000 2850 2000
Wire Wire Line
	2700 3400 2700 2450
Wire Wire Line
	2000 3400 2700 3400
Wire Wire Line
	4250 1500 4250 1200
Wire Wire Line
	2100 1300 2100 1900
Connection ~ 2000 1300
$Comp
L Fuse F1
U 1 1 599303B7
P 1750 1300
F 0 "F1" H 1830 1300 50  0000 C CNN
F 1 "Fuse" V 1675 1300 50  0000 C CNN
F 2 "Fuse_Holders_and_Fuses:Fuseholder_ATO_Blade_littlefuse_Pudenz_2_Pin" V 1680 1300 50  0001 C CNN
F 3 "" H 1750 1300 50  0001 C CNN
	1    1750 1300
	0    1    1    0   
$EndComp
Wire Wire Line
	1500 1300 1600 1300
Wire Wire Line
	1900 1300 2100 1300
$EndSCHEMATC
