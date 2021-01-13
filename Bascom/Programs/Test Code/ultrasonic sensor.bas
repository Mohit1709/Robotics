$regfile = "m16def.dat"
$crystal = 8000000
$hwstack = 40
$swstack = 16
$framesize = 32

Config Portb.3 = Output
Config Portd.2 = Input
Config Portc = Output
Config Lcdpin = Pin , Db4 = Portc.4 , Db5 = Portc.5 , Db6 = Portc.6 , Db7 = Portc.7 , E = Portc.1 , Rs = Portc.0
Config Lcd = 16 * 2

Dim Spd As Single , D As Single , T As Single , R As Single

Trigger Alias Portb.3                                       'OC0
Ech0 Alias Portd.2                                          'INT 0

Spd = 0.034                                                 'In     cm / us
Do

  Trigger = 1
  Waitus 10
  Trigger = 0

    While Ech0 = 1
    T = 0
    Wend

    While Ech0 = 0
    Waitus 10
    T = T + 1
    Wend

  R = Spd * T
  D = R / 2

  Cls
  Locate 1 , 2 : Lcd D + "cm"                               ' 2cm To 4m
  Waitms 100

Loop
End