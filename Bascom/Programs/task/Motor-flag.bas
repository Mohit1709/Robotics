$regfile = "m16def.dat"
$crystal = 8000000
$hwstack = 40
$swstack = 16
$framesize = 32

'************ Config Lcd*******************
Config Portc = Output
Config Lcdpin = Pin , Db4 = Portc.4 , Db5 = Portc.5 , Db6 = Portc.6 , Db7 = Portc.7 , E = Portc.1 , Rs = Portc.0
Config Lcd = 16 * 2

'***********Config PWM********************
Config Portd = Output
Config Timer1 = Pwm , Pwm = 8 , Compare A Pwm = Clear Up , Compare B Pwm = Clear Up , Prescale = 1

Config Portb = Input

Dim Flag As Byte

Mot11 Alias Portd.3 : Mot12 Alias Portd.0 : Spd1 Alias Pwm1b
Btn Alias Pinb.0
'************ Main ****************
Flag = 0
Do

    If Btn = 0 And Flag = 0 Then
        Flag = 1
    End If

    If Btn = 1 And Flag = 1 Then
        Waitms 25
        If Btn = 0 And Flag = 1 Then
            Flag = 2
        Else
            Set Mot11
            Reset Mot12
            Spd1 = 100
            Flag = 0
        End If
    End If

    If Btn = 1 And Flag = 2 Then
        Waitms 25
        If Btn = 0 And Flag = 2 Then
            Flag = 3
        Else
            Reset Mot11
            Set Mot12
            Spd1 = 100
            Flag = 0
        End If
    End If

    If Btn = 1 And Flag = 3 Then
         Spd1 = 0
         Flag = 0
    End If

    Cls
    Locate 1 , 1 : Lcd Flag
Loop
End