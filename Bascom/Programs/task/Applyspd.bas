$regfile = "m16def.dat"
$crystal = 8000000
$hwstack = 40
$swstack = 16
$framesize = 32

Declare Sub Applyspd()                                      '                                                                      Subroutine Declaration

'*************ALIAS NAMES*************
Mot11 Alias Portd.2 : Mot12 Alias Portd.3 : Mot1 Alias Pwm1b
Mot21 Alias Portc.6 : Mot22 Alias Portc.7 : Mot2 Alias Pwm2
Mot31 Alias Portc.1 : Mot32 Alias Portc.0 : Mot3 Alias Pwm0
Mot41 Alias Portd.0 : Mot42 Alias Portd.6 : Mot4 Alias Pwm1a

Dim Spd1 As Integer , Spd2 As Integer , Spd3 As Integer , Spd4 As Integer

Do
Loop
End

'***************** APPLYSPD SUBROUTINE***************
Sub Applyspd()

'************Mot1****************
        If Spd1 > 0 Then : Reset Mot12 : Set Mot11 : Mot1 = Spd1
        Elseif Spd1 = 0 Then : Reset Mot12 : Reset Mot11 : Mot1 = Spd1
        Elseif Spd1 < 0 Then : Spd1 = 0 - Spd1 : Set Mot12 : Reset Mot11 : Mot1 = Spd1
        End If

'************Mot2***************
        If Spd2 > 0 Then : Reset Mot22 : Set Mot21 : Mot2 = Spd2
        Elseif Spd2 = 0 Then : Reset Mot22 : Reset Mot21 : Mot2 = Spd2
        Elseif Spd2 < 0 Then : Spd2 = 0 - Spd2 : Set Mot22 : Reset Mot21 : Mot2 = Spd2
        End If

'************Mot3****************
        If Spd3 > 0 Then : Reset Mot32 : Set Mot31 : Mot3 = Spd3
        Elseif Spd3 = 0 Then : Reset Mot32 : Reset Mot31 : Mot3 = Spd3
        Elseif Spd3 < 0 Then : Spd3 = 0 - Spd3 : Set Mot32 : Reset Mot31 : Mot3 = Spd3
        End If

'************Mot4****************
        If Spd4 > 0 Then : Reset Mot42 : Set Mot41 : Mot4 = Spd4
        Elseif Spd4 = 0 Then : Reset Mot42 : Reset Mot41 : Mot4 = Spd4
        Elseif Spd4 < 0 Then : Spd4 = 0 - Spd4 : Set Mot42 : Reset Mot41 : Mot4 = Spd4
        End If

End Sub