$regfile = "m16def.dat"
$crystal = 8000000
$hwstack = 40
$swstack = 16
$framesize = 32

Config Portc = Output
Config Portd = Output
Config Pind.1 = Input
Config Porta = Input
Config Lcdpin = Pin , Db4 = Portc.4 , Db5 = Portc.5 , Db6 = Portc.6 , Db7 = Portc.7 , E = Portc.1 , Rs = Portc.0
Config Lcd = 16 * 2
Config Timer1 = Pwm , Pwm = 8 , Compare A Pwm = Clear Up , Compare B Pwm = Clear Up , Prescale = 1
Config Adc = Single , Prescaler = Auto


Dim A As Integer , Kp As Single , Error As Single , P As Single , Spda As Single , Spdb As Single
Dim B As Single
Dim C As Integer
Dim Flag As Integer

R Alias Compare1a
L Alias Compare1b

Kp = 0.1
Spda = 185
Spdb = 165
Start Adc

Do

A = Getadc(1)


If Pind.1 = 0 Then
Flag = 1
End If



 If Pind.1 = 1 And Flag = 1 Then

   B = A / 15
   Error = 30 - B
   P = Error * Kp

    Reset Portd.6
    Set Portd.7
    Reset Portd.0
    Set Portd.3

    R = Spda - Error                                        
    L = Spdb + Error


    End If

Loop
End