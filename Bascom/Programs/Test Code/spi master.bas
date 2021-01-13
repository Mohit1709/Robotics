$regfile = "m16def.dat"
$crystal = 8000000
$hwstack = 40
$swstack = 16
$framesize = 32

Config Portc = Input
Config Portb = Output
Config Portb.6 = Input
Config Spi = Hard , Interrupt = On , Master = Yes , Clockrate = 16

Dim A As Byte , I As Integer , Flag As Byte , C As Byte , D As Byte
Spiinit

Do
If Pinc.0 = 0 Then
Flag = 1
End If

If Pinc.0 = 1 And Flag = 1 Then
 If I < 100 Then

      For I = 0 To 100
        C = I Mod 5
          If C = 0 Then
                  A = Spimove(i)
                  Waitms 100
             End If
      Next
  End If
End If

Loop
End

'       C = I / 5
'      D = C * 5

'           If D = I Then
'           End If
