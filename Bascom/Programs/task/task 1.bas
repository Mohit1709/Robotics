$regfile = "m16def.dat"
$crystal = 8000000
$hwstack = 40
$swstack = 16
$framesize = 32

Dim A As Integer , B As Integer , I As Integer , Multi As Integer , Div As Integer , N As Integer


Do

Input A
Input B

For I = 1 To B

    Multi = Multi + A

Next To I

While A > 0

    A = A - B
    Div = Div + 1

Wend

Print "Multiplication = " + Multi
Print "Dividion = " + Div

Loop
End