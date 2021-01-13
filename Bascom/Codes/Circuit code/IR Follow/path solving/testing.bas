$regfile = "m16def.dat"
$crystal = 8000000
$hwstack = 40
$swstack = 16
$framesize = 32

Config Portc = Output
Config Lcdpin = Pin , Db4 = Portc.4 , Db5 = Portc.5 , Db6 = Portc.6 , Db7 = Portc.7 , E = Portc.1 , Rs = Portc.0
Config Lcd = 16 * 2
Config Portb = Input
Config Portd = Input



Dim A(50) As String * 1
Dim X As Integer , Y As Integer , I As Integer , C As Integer , Flag As Integer , S As Byte , Z As Byte , P As Byte
S = 1
Do

  P = S - 1
  Cls
  Locate 1 , 2 : Lcd P
  Locate 2 , 1 : Lcd A(p)
  Waitms 100

If Pind.1 = 0 And Flag = 0 Then
Flag = 1
End If

If Pind.1 = 1 And Flag = 1 Then

A(s) = "l"
S = S + 1
Flag = 0
End If

If Pind.2 = 0 And Flag = 0 Then
Flag = 2
End If

If Pind.2 = 1 And Flag = 2 Then

A(s) = "u"
S = S + 1
Flag = 0

End If

If Pinb.0 = 0 Then
Flag = 3
End If

If Pinb.0 = 1 And Flag = 3 Then

 For X = 1 To 50

  If A(x) = "l" Or A(x) = "s" Then

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

        Elseif A(x + 2) = "s" And A(x) = "s" Then           ' ==============> sus

           A(x) = "u"

           For Y = X To 50

           A(y + 1) = A(y + 3)

           Next To Y

           X = 0

        Elseif A(x + 2) = "r" Then                          ' ==============> Lur

           A(x) = "u"

           For Y = X To 50

           A(y + 1) = A(y + 3)

           Next To Y

           X = 0
        End If

     End If

  Elseif A(x) = "r" Then

      If A(x + 1) = "u" Then

        If A(x + 2) = "l" Then                              ' ==============> rul

           A(x) = "u"

           For Y = X To 50

           A(y + 1) = A(y + 3)

           Next To Y

           X = 0
         End If
      End If

  End If

Next To X

For Z = 1 To 15
  Cls
  Locate 2 , Z : Lcd A(z)
  Waitms 100

Next To Z

Flag = 0
End If



Loop
End