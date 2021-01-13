$regfile = "m16def.dat"
$crystal = 8000000
$hwstack = 40
$swstack = 16
$framesize = 32

Config Portb = Output
Config Portb.6 = Input
Config Spi = Hard , Interrupt = On , Data Order = Msb , Master = Yes , Polarity = High , Phase = 0 , Clockrate = 16

Dim A As Byte
Spiinit

Do

   A = Spimove(255)

   A = 10 Mod 5
   Print A

Loop
End