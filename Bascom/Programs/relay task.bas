$regfile = "m16def.dat"
$crystal = 4000000
$hwstack = 40
$swstack = 16
$framesize = 32

Config Portc = Output
Config Portb = Input


Do

 If Pinb.0 = 0 Then
 Set Portc.0
 Reset Portc.1
 Reset Portc.2
 Reset Portc.3
 End If

 '**********************
 If Pinb.1 = 0 Then
 Reset Portc.0
 Set Portc.1
 Reset Portc.2
 Reset Portc.3
 End If

 '*********************************

 If Pinb.2 = 0 Then
 Reset Portc.0
 Reset Portc.1
 Reset Portc.2
 Set Portc.3
 End If

 '*********************************

 If Pinb.3 = 0 Then
 Reset Portc.0
 Reset Portc.1
 Set Portc.2
 Reset Portc.3
 End If

 If Pinb.0 = 1 And Pinb.1 = 1 And Pinb.2 = 1 And Pinb.3 = 1 Then

 Reset Portc.0
 Reset Portc.1
 Reset Portc.2
 Reset Portc.3

 End If

Loop
End