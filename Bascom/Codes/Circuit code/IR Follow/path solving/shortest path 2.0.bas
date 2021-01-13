$regfile = "m16def.dat"
$crystal = 8000000
$hwstack = 40
$swstack = 16
$framesize = 32


Dim A(50) As String * 1
Dim X As Integer , Y As Integer , I As Integer , C As Integer

For I = 1 To 10

Input A(i)

Next To I


 For X = 1 To 50

  If A(x) = "l" Or A(x) = "s" Or A(x) = "r" Then

      If A(x + 1) = "u" Then

        If A(x + 2) = "l" And A(x) = "s" Then               ' ==============> sul

           A(x) = "r"

           For Y = X To 50

           A(y + 1) = A(y + 3)

           Next To Y

           X = 0

        Elseif A(x + 2) = "l" And A(x) = "l" Then           ' ==============> Lul

           A(x) = "s"

           For Y = X To 50

           A(y + 1) = A(y + 3)

           Next To Y

           X = 0

        Elseif A(x + 2) = "s" And A(x) = "l" Then           ' ==============> Lus

           A(x) = "r"

           For Y = X To 50

           A(y + 1) = A(y + 3)

           Next To Y

           X = 0

        Elseif A(x + 2) = "l" And A(x) = "r" Then           ' ==============> rul

           A(x) = "u"

           For Y = X To 50

           A(y + 1) = A(y + 3)

           Next To Y

           X = 0

        Elseif A(x + 2) = "s" And A(x) = "s" Then           ' ==============> sus

           A(x) = "u"

           For Y = X To 50

           A(y + 1) = A(y + 3)

           Next To Y

           X = 0

        Elseif A(x + 2) = "r" And A(x) = "l" Then           ' ==============> Lur

           A(x) = "u"

           For Y = X To 50

           A(y + 1) = A(y + 3)

           Next To Y

           X = 0
        End If

     End If

  End If

Next To X

For C = 1 To 5
Print A(c)
Next To C

End