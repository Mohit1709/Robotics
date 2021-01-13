$regfile = "m16def.dat"
$crystal = 8000000
$hwstack = 40
$swstack = 16
$framesize = 32

Config Portd = Output
Config Pind.1 = Input : Config Pinb.0 = Input
Btn0 Alias Pinb.0 : Btn1 Alias Pind.1
'*************Config LCD*************************
Config Portc = Output
Config Lcdpin = Pin , Db4 = Portc.4 , Db5 = Portc.5 , Db6 = Portc.6 , Db7 = Portc.7 , E = Portc.1 , Rs = Portc.0
Config Lcd = 16 * 2
'*************Config PWM*************************
Config Adc = Single , Prescaler = Auto                      '  Config  ADC
Dim A As Integer , B As Integer , C As Integer , D As Integer , E As Integer

Start Adc
Do

  A = Getadc(2) : B = Getadc(3) : C = Getadc(4) : D = Getadc(5) : E = Getadc(6)

  Cls
  Locate 1 , 1 : Lcd A : Locate 1 , 6 : Lcd B : Locate 1 , 12 : Lcd C : Locate 2 , 3 : Lcd D : Locate 2 , 10 : Lcd E
  Waitms 50

Loop
End