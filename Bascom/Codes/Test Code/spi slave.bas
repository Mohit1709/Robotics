$regfile = "m16def.dat"
$crystal = 8000000
$hwstack = 40
$swstack = 16
$framesize = 32


Config Portb = Input
Config Portb.6 = Output
Config Portc = Output
Config Lcdpin = Pin , Db4 = Portc.4 , Db5 = Portc.5 , Db6 = Portc.6 , Db7 = Portc.7 , E = Portc.1 , Rs = Portc.0
Config Lcd = 16 * 2
Config Spi = Hard , Interrupt = On , Master = No , Clockrate = 16

Dim I As Integer , A As Integer 

Spiinit

Do

     A = Spimove(i)

     Cls
     Locate 1 , 2 : Lcd A

Loop
End