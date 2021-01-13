$regfile = "m16def.dat"
$crystal = 4000000
$hwstack = 40
$swstack = 16
$framesize = 32

Config Timer1 = Pwm , Pwm = 8 , Compare A Pwm = Clear Up , Compare B Pwm = Clear Up , Prescale = 1


Config Portd = Output
Config Portb = Input
Config Pinb.3 = Output
Config Pinb.4 = Output

Dim A As Integer
Dim B As Integer

Do

  Set Portd.0
  Reset Portd.1
  Set Portd.6
  Reset Portd.7


 If Pinb.0 = 0 Then

  Compare1b = 150

  Compare1a = 0

  Set Portc.0
  Reset Portc.1
  Reset Portc.2
  Reset Portc.3

  Set Portb.3
  Reset Portb.4
 End If
'**********************

 If Pinb.1 = 0 Then

   Compare1b = 150
   Compare1a = 150
   Set Portc.0
   Reset Portc.1
   Reset Portc.2
   Set Portc.3

  Set Portb.4
  Reset Portb.3

 End If

 '***************
 If Pinb.2 = 0 Then

   Compare1b = 0
   Compare1a = 0
   Reset Portc.0
   Reset Portc.1
   Reset Portc.2
   Reset Portc.3

   Reset Portb.4
   Reset Portb.3

 End If

Loop
End