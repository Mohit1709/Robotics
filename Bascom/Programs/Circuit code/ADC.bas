$regfile = "m16def.dat"
$crystal = 4000000
$hwstack = 40
$swstack = 16
$framesize = 32

Config Portc = Output
Config Portd = Output
Config Pinb.0 = Input
Config Lcdpin = Pin , Db4 = Portc.4 , Db5 = Portc.5 , Db6 = Portc.6 , Db7 = Portc.7 , E = Portc.1 , Rs = Portc.0
Config Lcd = 16 * 2
Config Timer1 = Pwm , Pwm = 8 , Compare A Pwm = Clear Up , Compare B Pwm = Clear Down , Prescale = 1
Config Adc = Single , Prescaler = Auto

Dim A As Integer

Start Adc
Do

A = Getadc(1)
Cls
Waitms 20
Locate 1 , 2 : Lcd A
Waitms 20

Loop
End
