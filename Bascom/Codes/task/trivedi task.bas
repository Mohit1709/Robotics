$regfile = "m16def.dat"
$crystal = 8000000
$hwstack = 40
$swstack = 16
$framesize = 32

Config Portb = Input
'******************Config Lcd**********************
Config Portc = Output
Config Lcdpin = Pin , Db4 = Portc.4 , Db5 = Portc.5 , Db6 = Portc.6 , Db7 = Portc.7 , E = Portc.1 , Rs = Portc.0
Config Lcd = 16 * 2

Dim A As Integer , Flag As Byte

Btn Alias Pinb.0

A = 0
Do

  If Btn = 0 And Flag = 0 Then
  Flag = 1

  Elseif Btn = 1 And Flag = 1 Or Flag = 2 And Btn = 1 Then
    Incr A
    Flag = 2

  Elseif Btn = 0 And Flag = 2 Then
      Flag = 3

  Elseif Btn = 1 And Flag = 3 Or Flag = 4  And Btn = 1Then
      Decr A
      Flag = 4

  Elseif Btn = 0 And Flag = 4 Then
      Flag = 5

  Elseif Btn = 1 And Flag = 5 Then
     Flag = 0

  End If

     Cls
    Locate 1 , 1 : Lcd A + "    " + Flag
    Waitms 100

Loop
End