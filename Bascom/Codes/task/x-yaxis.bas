$regfile = "m16def.dat"
$crystal = 8000000
$hwstack = 40
$swstack = 16
$framesize = 32

Config Porta = Input
Config Portc = Output
Config Lcdpin = Pin , Db4 = Portc.4 , Db5 = Portc.5 , Db6 = Portc.6 , Db7 = Portc.7 , E = Portc.1 , Rs = Portc.0
Config Lcd = 16 * 2
Config Adc = Single , Prescaler = Auto

Declare Function Rc(byval I As Integer , R1 As Integer , R2 As Integer) As Integer

Dim A1 As Integer , A2 As Integer , X As Integer , Y As Integer
Dim A As Integer , B As Integer , C As Integer , D As Integer
A = 7 : B = 400                                             '                                                   Range for X axis
C = 99 : D = 255                                            '                                                  Range for Y axis

Start Adc
Do

A1 = Getadc(0) : A2 = Getadc(1)

X = Rc(a1 , A , B) : Y = Rc(a2 , C , D)

Cls
  Locate 1 , 1 : Lcd "(" + X + "," + Y + ")"
Waitms 50

Loop
End

Function Rc(byval I As Integer , R1 As Integer , R2 As Integer) As Integer

Dim M As Integer , Range As Single
M = 1023

      Range = R2 - R1
      Range = M / Range
      Range = I / Range
      Range = R1 + Range

      Rc = Range
End Function