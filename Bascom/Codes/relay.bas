$regfile = "m16def.dat"
$crystal = 4000000
$hwstack = 40
$swstack = 16
$framesize = 32

Config Portd = Output
Config Portb = Input

Dim A As Integer
Dim B As Integer

Do

 If Pinb.0 = 0 And A = 0 Then
 A = 1
 End If

 If Pinb.0 = 1 And A = 1 Then

 Set Portd.0
 Reset Portd.1
 Reset Portd.2
 Reset Portd.3

 A = 2
 End If

 If Pinb.0 = 0 And A = 2 Then
 A = 3
 End If


 If Pinb.0 = 1 And A = 3 Then

 Reset Portd.0
 Set Portd.1
 Reset Portd.2
 Reset Portd.3

 A = 0
 End If

'**********************

 If Pinb.1 = 0 And B = 0 Then
 B = 1
 End If

 If Pinb.1 = 1 And B = 1 Then

 Reset Portd.2
 Set Portd.3
 Reset Portd.0
 Reset Portd.1

 B = 2
 End If

 If Pinb.1 = 0 And B = 2 Then
 B = 3
 End If


 If Pinb.1 = 1 And B = 3 Then

 Set Portd.2
 Reset Portd.3
 Reset Portd.0
 Reset Portd.1

 B = 0
 End If

Loop
End