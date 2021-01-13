$regfile = "m16def.dat"
$crystal = 8000000
$hwstack = 40
$swstack = 16
$framesize = 32

'************ Config LCD *******************
Config Portb = Output
Config Lcdpin = Pin , Db4 = Portb.4 , Db5 = Portb.5 , Db6 = Portb.6 , Db7 = Portb.7 , E = Portb.1 , Rs = Portb.0
Config Lcd = 16 * 2

'*********** Config PWM ***************************
Config Portd = Output : Config Portc = Output
Config Timer1 = Pwm , Pwm = 8 , Compare A Pwm = Clear Up , Compare B Pwm = Clear Up , Prescale = 1
Config Timer0 = Pwm , Pwm = On , Compare Pwm = Clear Up , Prescale = 1
Config Timer2 = Pwm , Pwm = On , Compare Pwm = Clear Up , Prescale = 1
Enable Timer0 : Enable Timer2

'************ Config ADC ****************************
Config Porta = Input : Config Adc = Single , Prescaler = Auto

'************ FUNCTIONS ****************************
Declare Sub Applyspd() : Declare Sub Filterspd()
Declare Function Map(byval I As Integer , Byval R1 As Integer , Byval R2 As Integer , Byval R3 As Integer , Byval R4 As Integer) As Integer

'************* ALIAS NAMES *************
Mot11 Alias Portd.3 : Mot12 Alias Portd.2 : Mot1 Alias Pwm1b
Mot21 Alias Portc.6 : Mot22 Alias Portc.7 : Mot2 Alias Pwm2
Mot31 Alias Portc.1 : Mot32 Alias Portc.0 : Mot3 Alias Pwm0
Mot41 Alias Portd.0 : Mot42 Alias Portd.6 : Mot4 Alias Pwm1a

Dim Spdx As Integer , Spdy As Integer , Spd1 As Integer , Spd2 As Integer , Spd3 As Integer , Spd4 As Integer
Dim A1 As Integer , A2 As Integer , X As Integer , Y As Integer
Dim A As Integer , B As Integer , C As Integer , D As Integer
A = 0 : B = 255                                             '                                                                                           Range for X axis
C = 0 : D = 255                                             '                                                                                           Range for Y axis
'*************** Main Funtion *************************
Start Adc
Do

A1 = Getadc(0) : A2 = Getadc(1)
X = Map(a1 , A , B , 0 , 1023 ) : Y = Map(a2 , C , D , 0 , 1023)

Select Case X :

    Case 0 To 127 :
        Select Case Y
            Case 0 To 127 :                                 '                                                                                          FORWARD LEFT
                 Spdy = Map(x , 0 , 255 , 127 , 0) : Spdx = Map(y , 0 , 255 , 127 , 0)
                 Spd1 = Spdx : Spd2 = -spdy : Spd3 = Spdx : Spd4 = -spdy

            Case 128 To 255 :                               '                                                                                        BACKWARD LEFT
                 Spdy = Map(x , 0 , 255 , 127 , 0) : Spdx = Map(y , 0 , 255 , 127 , 255)
                 Spd1 = -spdx : Spd2 = -spdy : Spd3 = -spdx : Spd4 = -spdy
        End Select

    Case 128 To 255:
        Select Case Y
            Case 0 To 127 :                                 '                                                                                          FORWARD RIGHT
                 Spdy = Map(x , 0 , 255 , 127 , 255) : Spdx = Map(y , 0 , 255 , 127 , 0)
                 Spd1 = Spdx : Spd2 = Spdy : Spd3 = Spdx : Spd4 = Spdy

            Case 128 To 255 :                               '                                                                                        BACKWARD RIGHT
                 Spdy = Map(x , 0 , 255 , 127 , 255) : Spdx = Map(y , 0 , 255 , 127 , 255)
                 Spd1 = -spdx : Spd2 = Spdy : Spd3 = -spdx : Spd4 = Spdy
        End Select

End Select : Call Applyspd

Cls
   Locate 1 , 2 : Lcd "(" + X + "," + Y + ")"               '                                                                            Print Analog Value
   Locate 2 , 2 : Lcd "Spd : " + "(" + Spdx + "," + Spdy + ")"       '                                                       Print spd
Waitms 10

Loop
End

'***************** APPLYSPD SUBROUTINE ***************
Sub Applyspd()
        Call Filterspd
'************ Mot1 ****************
        If Spd1 > 0 Then : Reset Mot12 : Set Mot11 : Mot1 = Spd1
        Elseif Spd1 = 0 Then : Reset Mot12 : Reset Mot11 : Mot1 = Spd1
        Elseif Spd1 < 0 Then : Spd1 = 0 - Spd1 : Set Mot12 : Reset Mot11 : Mot1 = Spd1
        End If

'************ Mot2 ***************
        If Spd2 > 0 Then : Reset Mot22 : Set Mot21 : Mot2 = Spd2
        Elseif Spd2 = 0 Then : Reset Mot22 : Reset Mot21 : Mot2 = Spd2
        Elseif Spd2 < 0 Then : Spd2 = 0 - Spd2 : Set Mot22 : Reset Mot21 : Mot2 = Spd2
        End If

'************ Mot3 ****************
        If Spd3 > 0 Then : Reset Mot32 : Set Mot31 : Mot3 = Spd3
        Elseif Spd3 = 0 Then : Reset Mot32 : Reset Mot31 : Mot3 = Spd3
        Elseif Spd3 < 0 Then : Spd3 = 0 - Spd3 : Set Mot32 : Reset Mot31 : Mot3 = Spd3
        End If

'************ Mot4 ****************
        If Spd4 > 0 Then : Reset Mot42 : Set Mot41 : Mot4 = Spd4
        Elseif Spd4 = 0 Then : Reset Mot42 : Reset Mot41 : Mot4 = Spd4
        Elseif Spd4 < 0 Then : Spd4 = 0 - Spd4 : Set Mot42 : Reset Mot41 : Mot4 = Spd4
        End If

End Sub

'*************** FUNCTION FOR MAPPING RANGE *****************
Function Map(i As Integer , R1 As Integer , R2 As Integer , R3 As Integer , R4 As Integer) As Integer

Dim Range As Single , Ar1 As Integer , Ar2 As Integer

      Ar2 = R2 - R1 : Ar1 = R4 - R3 : Range = Ar1 / Ar2
      I = I - R3 : Range = I / Range : Range = R1 + Range
      Map = Range

End Function

'*****************  FILTERING SPD ***************
Sub Filterspd()
'*************** Mot1 ******************
  If Spd1 < -255 Then : Spd1 = -255
  Elseif Spd1 > 255 Then : Spd1 = 255
  End If

'*************** Mot2 ******************
  If Spd2 < -255 Then : Spd2 = -255
  Elseif Spd2 > 255 Then : Spd2 = 255
  End If

'*************** Mot3 ******************
  If Spd3 < -255 Then : Spd3 = -255
  Elseif Spd3 > 255 Then : Spd3 = 255
  End If

'*************** Mot4 ******************
  If Spd4 < -255 Then : Spd4 = -255
  Elseif Spd4 > 255 Then : Spd4 = 255
  End If

End Sub