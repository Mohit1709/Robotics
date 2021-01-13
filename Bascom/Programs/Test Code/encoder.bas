$regfile = "m16def.dat"
$crystal = 8000000
$hwstack = 40
$swstack = 16
$framesize = 32

'**************** Lcd configuration **************************
Config Porta = Output
Config Lcdpin = Pin , Db4 = Porta.4 , Db5 = Porta.5 , Db6 = Porta.6 , Db7 = Porta.7 , E = Porta.1 , Rs = Porta.0
Config Lcd = 16 * 2

'*************** Input for Button**************
Config Portb.0 = Input

'**************Interrupt Configuration **************
Config Portd.2 = Input : Config Portd.3 = Input
Enable Int0 : Config Int0 = Rising : On Int0 Rotation
Enable Interrupts

'**************Pwm Control Configuration**************
Config Portd = Output
Config Timer1 = Pwm , Pwm = 8 , Compare A Pwm = Clear Up , Compare B Pwm = Clear Up , Prescale = 1

'**************Declaring Variable*******************
Btn Alias Pinb.0
Encout Alias Pind.3                                         '                                                                24 Count per rotation
Mot11 Alias Pind.0 : Mot12 Alias Pind.1 : Spd1 Alias Pwm1b

Dim Count As Integer , Rot As Integer
Rot = 0
Do

    Spd1 = 100                                              '      Initialization  of speed

    If Btn = 0 Then                                         '  Condition to control Direction of Motor
        Set Mot11
        Reset Mot12
    Else
        Set Mot12
        Reset Mot11
    End If

    Cls
    Locate 1 , 1 : Lcd Count                                ' Print result
    Locate 2 , 1 : Lcd Rot                                  ' Print result
    Waitms 50

Loop
End
'****************Interrupt Lable**************
Rotation:
    Incr Count
    If Count = 24 Then
        Incr Rot
        Count = 0
    End If
Return