$regfile = "m16def.dat"
$crystal = 4000000
$hwstack = 40
$swstack = 16
$framesize = 32

Config Portc = Output
Config Portd = Output
Config Pinb.0 = Input
Config Lcdpin = Pin , Db4 = Portc.2 , Db5 = Portc.3 , Db6 = Portc.4 , Db7 = Portc.5 , E = Portc.1 , Rs = Portc.0
Config Lcd = 16 * 2
Config Timer1 = Pwm , Pwm = 8 , Compare A Pwm = Clear Up , Compare B Pwm = Clear Up , Prescale = 1
Config Adc = Single , Prescaler = Auto


Dim Flag As Integer

Do


Cls
Waitms 10
Locate 1 , 6 : Lcd "Yash patil "
Waitms 90

If Pinb.0 = 0 Then
Flag = 1
End If


If Pinb.0 = 1 And Flag = 1 Then
      Set Portb.2
    Reset Portb.3
    Compare1a = 255


    Set Portd.0
    Reset Portd.1
    Compare1b = 255



End If

Loop
End