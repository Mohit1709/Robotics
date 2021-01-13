$regfile = "m16def.dat"
$crystal = 8000000
$hwstack = 40
$swstack = 16
$framesize = 32

Config Portd = Output
Config Portb = Input
Config Pind.1 = Input
Config Porta = Input
Config Portc = Output
Config Lcdpin = Pin , Db4 = Portc.4 , Db5 = Portc.5 , Db6 = Portc.6 , Db7 = Portc.7 , E = Portc.1 , Rs = Portc.0
Config Lcd = 16 * 2
Config Timer1 = Pwm , Pwm = 8 , Compare A Pwm = Clear Up , Compare B Pwm = Clear Up , Prescale = 1
Config Adc = Single , Prescaler = Auto


Dim L1 As Integer , L2 As Integer , C As Integer , R1 As Integer , R2 As Integer , A(30) As String * 1 , P(30) As String * 1
Dim Flag As Integer , X As Integer , Y As Integer , S As Integer , R As Integer , U As Integer , M As Integer , D As Integer

Mot1 Alias Compare1a
Mot2 Alias Compare1b
Mot11 Alias Portd.7
Mot12 Alias Portd.6
Mot21 Alias Portd.3
Mot22 Alias Portd.0
D = 1
Start Adc
Do

L2 = Getadc(2)
L1 = Getadc(3)
C = Getadc(4)
R1 = Getadc(5)
R2 = Getadc(6)

Cls
Locate 1 , 2 : Lcd Y
Locate 2 , 1 : Lcd R2
Locate 2 , 6 : Lcd A(y)

Waitms 100

If Pind.1 = 0 And Flag = 0 Then
Flag = 1
End If

If Pind.1 = 1 And Flag = 1 Then

     If L2 > 700 Then
     X = 1
     S = 1

     Elseif R2 > 700 And R = 1 Then
     S = 1
     X = 2
     If U = 1 Then
     X = 3
     S = 1
     U = 2
     End If
     R = 2

     Elseif C > 700 And S = 1 Then

     If X = 1 Then
     Y = Y + 1
     A(y) = "l"
     X = 5
     Elseif X = 3 Then
     Y = Y + 1
     A(y) = "u"
     X = 5
     Elseif X = 2 Then
     Y = Y + 1
     A(y) = "r"
     X = 5

     End If

     S = 2

     Elseif C > 700 Then

     Elseif L1 > 700 Then

     Elseif R2 > 700 Then
     R = 1

     Elseif R1 > 700 Then

     Elseif L1 < 700 And L2 < 700 And C < 700 And R1 < 700 And R2 < 700 Then
     R = 1
     U = 1
     End If
End If


Loop
End