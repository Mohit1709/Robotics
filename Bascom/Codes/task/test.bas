$regfile = "m16def.dat"
$crystal = 8000000
$hwstack = 40
$swstack = 16
$framesize = 32

Declare Sub Test(m As Integer , N As Integer)

Dim A As Integer , B As Integer
A = 10 : B = 20
Print B + "  " + A

Call Test(a , B)

Print B + "  " + A
End

Sub Test(m As Integer , N As Integer)
M = 20 : N = 10
End Sub