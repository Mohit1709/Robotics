$regfile = "m16def.dat"
$crystal = 4000000
$hwstack = 40
$swstack = 16
$framesize = 32

Config Portc = Output
Config Pinb.0 = Input
Config Portd = Output
Config Timer1 = Pwm , Pwm = 8 , Compare A Pwm = Clear Up , Compare B Pwm = Clear Down , Prescale = 1

Config Lcdpin = Pin , Db4 = Portc.4 , Db5 = Portc.5 , Db6 = Portc.6 , Db7 = Portc.7 , E = Portc.1 , Rs = Portc.0
Config Lcd = 16 * 2

Do


    Set Portd.0
    Reset Portd.3
    Compare1a = 255


    Set Portb.3
    Reset Portb.4
    Compare1b = 255


Loop
End