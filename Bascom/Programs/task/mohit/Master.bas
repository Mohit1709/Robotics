$regfile = "m16def.dat"
$crystal = 8000000
$hwstack = 40
$swstack = 16
$framesize = 32

Config Portb = Output
Config Portb.6 = Input
Config Portd.0 = Input
Config Lcdpin = Pin , Db4 = Portc.4 , Db5 = Portc.5 , Db6 = Portc.6 , Db7 = Portc.7 , E = Portc.1 , Rs = Portc.0
Config Lcd = 16 * 2
Config Spi = Hard , Interrupt = On , Master = Yes , Clockrate = 16

Dim A As Byte , I As Byte , Flag As Byte
Spiinit

Do
If Pind.0 = 0 And Flag = 0 Then
Flag = 1
End If

If Pind.0 = 1 And Flag = 1 Then

  If I < 100 Then
      I = I + 5
      Waitms 100
      A = Spimove(i)
  End If

End If

Loop
End