$regfile = "m16def.dat"
$crystal = 8000000
$hwstack = 40
$swstack = 16
$framesize = 32

Config Portb = Output : Config Portb.6 = Input : Config Portc = Output
Config Lcdpin = Pin , Db4 = Portc.4 , Db5 = Portc.5 , Db6 = Portc.6 , Db7 = Portc.7 , E = Portc.1 , Rs = Portc.0
Config Lcd = 16 * 2
Config Spi = Hard , Interrupt = On , Data Order = Msb , Master = Yes , Clockrate = 16

Dim A As Byte
A = 15
Spiinit

Do

     Spiout A , 2
     Waitms 10
Loop
End