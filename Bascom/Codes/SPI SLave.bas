$regfile = "m16def.dat"
$crystal = 8000000
$hwstack = 40
$swstack = 16
$framesize = 32

Config Portb = Input : Config Portb.6 = Output : Config Portc = Output
Config Lcdpin = Pin , Db4 = Portc.4 , Db5 = Portc.5 , Db6 = Portc.6 , Db7 = Portc.7 , E = Portc.1 , Rs = Portc.0
Config Lcd = 16 * 2
Config Spi = Hard , Interrupt = On , Data Order = Msb , Master = No , Polarity = High , Phase = 0 , Clockrate = 16

Dim A As Byte

Spiinit

Do

     Spiin A , 2

     Cls
     Locate 1 , 2 : Lcd A
     Waitms 10

Loop
End