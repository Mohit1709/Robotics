$regfile = "m16def.dat"
$Crystal=4000000
$hwstack=40
$swstack=16
$framesize=32

Config Porta = Output
Do

 Set Porta.0
   Reset Porta.3

   Waitms 50

 Reset Porta.0
 Set Porta.1
 Waitms 50

 Reset Porta.0
 Reset Porta.1
 Set Porta.2
 Waitms 50

 Reset Porta.0
 Reset Porta.1
 Reset Porta.2
 Set Porta.3
 Waitms 50

 Loop
 End

