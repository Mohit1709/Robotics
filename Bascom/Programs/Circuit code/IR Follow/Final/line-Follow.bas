$regfile = "m16def.dat"
$crystal = 8000000
$hwstack = 40
$swstack = 16
$framesize = 32

Config Portd = Output
Config Porta = Input
Config Pind.1 = Input : Config Pinb.0 = Input

Config Timer1 = Pwm , Pwm = 8 , Compare A Pwm = Clear Up , Compare B Pwm = Clear Up , Prescale = 1
Config Adc = Single , Prescaler = Auto


Dim L1 As Integer , L2 As Integer , C As Integer , R1 As Integer , R2 As Integer , Flag As Bit

'***************Alias Names********************
Mot11 Alias Portd.7 : Mot12 Alias Portd.6 : Spd1 Alias Compare1a
Mot21 Alias Portd.3 : Mot22 Alias Portd.0 : Spd2 Alias Compare1b
Btn1 Alias Pind.1 : Btn0 Alias Pinb.0

Start Adc
Flag = 0
Do

    L2 = Getadc(2)
    L1 = Getadc(3)
    C = Getadc(4)
    R1 = Getadc(5)
    R2 = Getadc(6)

    If Btn1 = 0 Then
        Flag = 1
    End If

    If Btn1 = 1 And Flag = 1 Then

        If L2 > 800 Then

            Set Mot12
            Reset Mot11
            Set Mot21
            Reset Mot22

            Spd1 = 210
            Spd2 = 180

        Elseif L1 < 700 And L2 < 700 And C < 700 And R1 < 700 And R2 < 700 Then

            Set Mot11
            Reset Mot12
            Set Mot22
            Reset Mot21

            Spd1 = 170
            Spd2 = 220

        Elseif R1 > 800 Then

            Set Mot11
            Reset Mot22
            Set Mot21
            Reset Mot22

            Spd1 = 190
            Spd2 = 170

        Elseif L1 > 800 Then

            Set Mot11
            Reset Mot12
            Set Mot21
            Reset Mot22

            Spd1 = 170
            Spd2 = 190

        End If
    End If

Loop
End