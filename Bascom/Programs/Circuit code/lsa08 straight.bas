$regfile = "m16def.dat"
$crystal = 4000000
$hwstack = 40
$swstack = 16
$framesize = 32

Config Portd = Output
Config Pind.1 = Input
'*************Config LCD*************************
Config Portc = Output
Config Lcdpin = Pin , Db4 = Portc.4 , Db5 = Portc.5 , Db6 = Portc.6 , Db7 = Portc.7 , E = Portc.1 , Rs = Portc.0
Config Lcd = 16 * 2
'*************Config PWM*************************
Config Timer1 = Pwm , Pwm = 8 , Compare A Pwm = Clear Up , Compare B Pwm = Clear Up , Prescale = 1
Config Adc = Single , Prescaler = Auto                      '  Config  ADC

'*************ALIAS NAMES**********************
Mot11 Alias Portd.0 : Mot12 Alias Portd.3 : Spd1 Alias Pwm1b
Mot21 Alias Portc.6 : Mot22 Alias Portc.7 : Spd2 Alias Pwm1a
Btn0 Alias Pinb.0 : Btn1 Alias Pind.1

Dim A As Integer , Flag As Bit

Start Adc
Do
    A = Getadc(1)
'Cls
'Waitms 10
'Locate 1 , 6 : Lcd A
'Waitms 90
    If Btn1 = 0 Then
        Flag = 1
    End If
    If Btn1 = 1 And Flag = 1 Then
        Set Mot11 : Reset Mot12 : Spd1 = 185                ' LEFT
        Set Mot21 : Reset Mot22 : Spd2 = 165                '  RIGHT
    End If
Loop
End