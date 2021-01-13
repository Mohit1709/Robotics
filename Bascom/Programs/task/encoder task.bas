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
Enable Int0 : Config Int0 = Falling : On Int0 Direction
Enable Interrupts

'**************Pwm Control Configuration**************
Config Portd = Output
Config Timer1 = Pwm , Pwm = 8 , Compare A Pwm = Clear Up , Compare B Pwm = Clear Up , Prescale = 1

'**************Declaring Variable*******************
Btn Alias Pinb.0
Encout Alias Pind.3
Mot11 Alias Pind.0 : Mot12 Alias Pind.1 : Spd1 Alias Pwm1b

Dim X As Integer

Do

    Spd1 = 5                                                ' Initialization  of speed

    If Btn = 0 Then                                         '  Condition to control Direction of Motor
        Set Mot11
        Reset Mot12
    Else
        Set Mot12
        Reset Mot11
    End If

    Cls
    Locate 1 , 1 : Lcd X                                    ' Print result
    Waitms 50

Loop
End
'****************Interrupt Lable**************
Direction:
    If Encout = 1 Then                                      ' Condition to Check the Direction of Rotation
        Incr X                                              '         Anti-clock wise
    Else
        Decr X                                              '          Clock wise
    End If
Return