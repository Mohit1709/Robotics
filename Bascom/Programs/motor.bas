$regfile = "m16def.dat"
$crystal = 8000000
$hwstack = 40
$swstack = 16
$framesize = 32

Config Portd = Output
Config Portc = Output


Config Lcdpin = Pin , Db4 = Portc.4 , Db5 = Portc.5 , Db6 = Portc.6 , Db7 = Portc.7 , E = Portc.1 , Rs = Portc.0
Config Lcd = 16 * 2
Config Timer1 = Pwm , Pwm = 8 , Compare A Pwm = Clear Up , Compare B Pwm = Clear Up , Prescale = 1

Dim A As Integer

L Alias Compare1a
R Alias Compare1b
Mot12 Alias Portd.3
Mot11 Alias Portd.0
Mot22 Alias Portd.7
Mot21 Alias Portd.6

Do

For A = 1 To 250
    L = A
    R = A
    Cls
    Locate 1 , 2 : Lcd A
    Waitms 100

     Set Mot11
     Reset Mot12
     Set Mot21
     Reset Mot22
     A = A + 1

     Next

Loop
End