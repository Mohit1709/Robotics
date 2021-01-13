$regfile = "m16def.dat"
$crystal = 8000000
$hwstack = 40
$swstack = 16
$framesize = 32
$baud = 19200

Config Portc = Output : Config Portd = Output : Config Porta = Input
Config Lcdpin = Pin , Db4 = Portc.2 , Db5 = Portc.3 , Db6 = Portc.4 , Db7 = Portc.5 , E = Portc.1 , Rs = Portc.0
Config Lcd = 16 * 2
Config Timer1 = Pwm , Pwm = 8 , Compare A Pwm = Clear Up , Compare B Pwm = Clear Up , Prescale = 1

Dim A As Integer

Do
'If Pinb.0 = 0 Then
'Flag = 1
'End If

 If Pinb.0 = 1 And Flag = 1 Then

'    Set Portd.0
'    Reset Portd.3
'    Set Portd.6
'    Reset Portd.7

'    '********************************left
    ' If Porta.4 = 1 Then
'       A = 0

'     Elseif Porta.3 = 1 Then
'      A = 10
'          Elseif Porta.5 = 1 Then
'         A = 20
'     '**********************************straight
'     Elseif Porta.2 = 1 Then
'        A = 30

'     Elseif Porta.6 = 1 Then
'       A = 40

'    '********************************right

'     Elseif Porta.1 = 1 Then
'      A = 50

'     Elseif Porta.7 = 1 Then
'     A = 60

'     Elseif Porta.0 = 1 Then

'     A = 70

'    End If
    Print A
Loop
End

Rbcn:
   A = Inkey()
Return