$regfile = "m16def.dat"
$crystal = 4000000
$hwstack = 40
$swstack = 16
$framesize = 32
$baud = 9600

Config Portc = Output
Config Lcdpin = Pin , Db4 = Portc.2 , Db5 = Portc.3 , Db6 = Portc.4 , Db7 = Portc.5 , E = Portc.1 , Rs = Portc.0
Config Lcd = 16 * 2

Dim X As String * 1

Enable Interrupts : Enable Urxc : On Urxc Rbcn

Do
 ' Locate 1 , 1
'  Lcd X + "  " + " RBCN"
 Print "mohit"

Loop
End

Rbcn:
   X = Inkey()

Return