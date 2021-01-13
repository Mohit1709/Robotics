$regfile = "m16def.dat"
$crystal = 8000000
$hwstack = 40
$swstack = 16
$framesize = 32

'**************** Config LCD **************************
Config Porta = Output
Config Lcdpin = Pin , Db4 = Porta.4 , Db5 = Porta.5 , Db6 = Porta.6 , Db7 = Porta.7 , E = Porta.1 , Rs = Porta.0
Config Lcd = 16 * 2

'**************Config Interrupt **************
Config Portd.2 = Input
Enable Int0 : Config Int0 = Rising : On Int0 Rotation
Enable Interrupts

'**************Config PWM**************
Config Portd = Output
Config Timer1 = Pwm , Pwm = 8 , Compare A Pwm = Clear Up , Compare B Pwm = Clear Up , Prescale = 1

Declare Function Rc(byval I As Integer , R1 As Integer , R2 As Integer , R3 As Integer , R4 As Integer) As Integer

'**************ALIAS NAMES*******************
Btn Alias Pinb.0
Encout Alias Pind.3
Mot11 Alias Pind.1 : Mot12 Alias Pind.0 : Spd1 Alias Pwm1b

Dim Count As Integer , Spd As Integer
Dim C1 As Integer , C2 As Integer , S1 As Integer , S2 As Integer
C1 = 0 : C2 = 500                                           ' Count
S1 = 1 : S2 = 255                                           ' Speed
'************ Main Function*************************
Count = 0
Do

    Set Mot11
    Reset Mot12
    Spd1 = Spd

    Cls
    Locate 1 , 1 : Lcd "Speed : " + Spd                     ' Print result
    Locate 2 , 1 : Lcd "Count : " + Count                   ' Print result

    If Spd > 254 Then
        C1 = 500 : C2 = 1000
        S1 = 255 : S2 = 0
    End If

    Spd = Rc(count , S1 , S2 , C1 , C2)

Loop
End

'*************** FUNCTION OF RANGE CONVERTION*****************
Function Rc(byval I As Integer , R1 As Integer , R2 As Integer , R3 As Integer , R4 As Integer) As Integer

Dim Range As Single , A4 As Integer , A2 As Integer

      A2 = R2 - R1
      A4 = R4 - R3
      Range = A4 / A2
      I = I - R3
      Range = I / Range
      Range = R1 + Range
      Rc = Range

End Function

'****************INTERRUPT LABEL**************
Rotation:                                                   '                                         24 Count per rotation
    Incr Count
Return