$regfile = "m16def.dat"
$crystal = 4000000
$hwstack = 40
$swstack = 16
$framesize = 32

Config Portd = Input
Config Portb = Input
Config Portc = Output
Config Lcdpin = Pin , Db4 = Portc.4 , Db5 = Portc.5 , Db6 = Portc.6 , Db7 = Portc.7 , E = Portc.1 , Rs = Portc.0
Config Lcd = 16 * 2


Dim A As Integer
Dim B As Integer
Dim C As Integer
Dim S As Integer
Dim D As Integer
Dim Flag As Integer

Flag = 1
D = 1
Do

'*********************First

If Pinb.0 = 0 And Flag = 1 Then
Flag = 2
End If

  If Pinb.0 = 1 And Flag = 2 Then
  A = A + 1
  Cls
  Locate 1 , 1 : Lcd A
  Waitms 80
  Flag = 1
  End If


'*********************  Sign

'If Pind.0 = 0 And Flag = 1 And D = 1 Then
'Flag = 2
'D = 2
'End If

'   If Pind.0 = 1 And Flag = 2 And D = 2 Then
'   Cls
'   Locate 1 , 3 : Lcd "+"
'   Waitms 80
'   Flag = 1
'   D = 3
'   End If

'If Pind.0 = 0 And Flag = 1 And D = 3 Then
'Flag = 2
'D = 4
'End If

'   If Pind.0 = 1 And Flag = 2 And D = 4 Then
'   Cls
'   Locate 1 , 3 : Lcd "-"
'   Waitms 80
'   Flag = 1
'   D = 5
'   End If

'If Pind.0 = 0 And Flag = 1 And D = 5 Then
'Flag = 2
'D = 6
'End If

'   If Pind.0 = 1 And Flag = 2 And D = 6 Then
'   Cls
'   Locate 1 , 3 : Lcd "*"
'   Waitms 80
'   Flag = 1
'   D = 7
'   End If

'If Pind.0 = 0 And Flag = 1 And D = 7 Then
'Flag = 2
'D = 8
'End If

'   If Pind.0 = 1 And Flag = 2 And D = 8 Then
'   Cls
'   Locate 1 , 3 : Lcd "/"
'   Waitms 80
'   Flag = 1
'   D = 1
'   End If
'********************* Second

If Pinb.4 = 0 And Flag = 1 Then
Flag = 2
End If

  If Pinb.4 = 1 And Flag = 2 Then
  B = B + 1
  Cls
  Locate 2 , 1 : Lcd B
  Waitms 80
  Flag = 1
  End If

'***************** Answer
  If Pinb.6 = 0 And Flag = 1 Then
  Flag = 2
  End If

  If Pinb.6 = 1 And Flag = 2 Then

  Input , S
  Select Case S

  Case 1 : C = A + B

  Case 2 : C = A - B

  Case 3 : C = A * B

  Case 4 : C = A / B
  End Select

  Cls
  Locate 2 , 5 : Lcd C
  Waitms 80
  A = 0
  B = 0
  Flag = 1

  End If


Loop
End