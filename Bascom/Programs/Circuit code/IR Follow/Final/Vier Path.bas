$regfile = "m16def.dat"
$crystal = 8000000
$hwstack = 40
$swstack = 16
$framesize = 32

Config Portd = Output
Config Pind.1 = Input
Config Porta = Input
Config Timer1 = Pwm , Pwm = 8 , Compare A Pwm = Clear Up , Compare B Pwm = Clear Up , Prescale = 1
Config Adc = Single , Prescaler = Auto


Dim L1 As Integer , L2 As Integer , C As Integer , R1 As Integer , R2 As Integer , A As Integer
Dim Flag As Integer , X As Integer , Y As Integer , S As Integer , R As Integer , U As Integer , M As Integer , D As Integer

Mot1 Alias Compare1a
Mot2 Alias Compare1b
Mot11 Alias Portd.7
Mot12 Alias Portd.6
Mot21 Alias Portd.3
Mot22 Alias Portd.0

Start Adc
Do

L2 = Getadc(2)
L1 = Getadc(3)
C = Getadc(4)
R1 = Getadc(5)
R2 = Getadc(6)

If Pind.1 = 0 Then
Flag = 1
End If

If Pind.1 = 1 And Flag = 1 Then

     If L2 > 700 And R2 < 700 Then

     Set Mot12
     Reset Mot11
     Set Mot21
     Reset Mot22

     Mot1 = 210
     Mot2 = 180

     Elseif C > 700 Then

     Set Mot11
     Reset Mot12
     Set Mot21
     Reset Mot22

     Mot1 = 200
     Mot2 = 190

     Elseif R2 > 700 And L2 < 700 Then

     Set Mot11
     Reset Mot12
     Set Mot22
     Reset Mot21

     Mot1 = 170
     Mot2 = 220

     Elseif L1 > 700 Then

     Set Mot11
     Reset Mot12
     Set Mot21
     Reset Mot22

     Mot1 = 170
     Mot2 = 190

     Elseif R1 > 700 Then

     Set Mot11
     Reset Mot22
     Set Mot21
     Reset Mot22

     Mot1 = 190
     Mot2 = 170

     Elseif L1 < 700 And L2 < 700 And C < 700 And R1 < 700 And R2 < 700 Then

     Set Mot12
     Reset Mot11
     Set Mot21
     Reset Mot22

     Mot1 = 210
     Mot2 = 180

     End If

 End If

Loop
End