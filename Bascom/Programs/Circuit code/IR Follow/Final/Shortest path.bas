$regfile = "m16def.dat"
$crystal = 8000000
$hwstack = 40
$swstack = 16
$framesize = 32

'Config Portd = Output
Config Portb = Input
Config Pind.1 = Input : Config Pind.2 = Input
Config Porta = Input
Config Portc = Output
Config Lcdpin = Pin , Db4 = Portc.4 , Db5 = Portc.5 , Db6 = Portc.6 , Db7 = Portc.7 , E = Portc.1 , Rs = Portc.0
Config Lcd = 16 * 2
Config Timer1 = Pwm , Pwm = 8 , Compare A Pwm = Clear Up , Compare B Pwm = Clear Up , Prescale = 1
Config Adc = Single , Prescaler = Auto

Dim S As Byte , R As Byte , U As Byte , M As Byte , D As Byte , Q As Byte , I As Byte , P As Byte , F As Byte , Z As Byte , E As Byte
Dim L1 As Integer , L2 As Integer , C As Integer , R1 As Integer , R2 As Integer , A(50) As String * 1
Dim Flag As Byte , X As Integer , Y As Integer

Mot11 Alias Portd.7 : Mot12 Alias Portd.6 : Mot1 Alias Compare1a
Mot21 Alias Portd.3 : Mot22 Alias Portd.0 : Mot2 Alias Compare1b

D = 1
F = 1
Start Adc
Do

    L2 = Getadc(2)
    L1 = Getadc(3)
    C = Getadc(4)
    R1 = Getadc(5)
    R2 = Getadc(6)

    If Pind.1 = 0 And Flag = 0 Then
        Flag = 1
    End If

    If Pind.1 = 1 And Flag = 1 Then

        Cls
        Locate 1 , 2 : Lcd Q
        Locate 2 , 1 : Lcd R2
        Locate 2 , 6 : Lcd A(q)
        Waitms 100

         If L2 > 700 Then

             Set Mot12
             Reset Mot11
             Set Mot21
             Reset Mot22

             Mot1 = 210
             Mot2 = 180

             P = 1
             E = 1

         Elseif R2 > 700 And R = 1 Then
              E = 1
              P = 2

              If U = 1 Then
              P = 3
              E = 1
              U = 2

              End If
              R = 2

         Elseif C > 700 And E = 1 Then

             If P = 1 Then
             Q = Q + 1
             A(q) = "l"
             P = 5

             Elseif P = 3 Then
                 Q = Q + 1
                 A(q) = "u"
                 P = 5

             Elseif P = 2 Then
                 Q = Q + 1
                 A(q) = "r"
                 P = 5

             End If
             E = 2

         Elseif C > 700 And R2 > 700 And S = 1 Then
             Q = Q + 1
             A(q) = "s"
             S = 2

         Elseif L1 > 700 Then
             Set Mot11
             Reset Mot12
             Set Mot21
             Reset Mot22

             Mot1 = 170
             Mot2 = 190
             R = R + 1

         Elseif C > 700 Then
             Set Mot11
             Reset Mot12
             Set Mot21
             Reset Mot22

             Mot1 = 200
             Mot2 = 190
             S = 1

     Elseif R2 > 700 Then

     Set Mot11
     Reset Mot12
     Set Mot22
     Reset Mot21

     Mot1 = 170
     Mot2 = 220

     R = 0

     Elseif R1 > 700 Then

     Set Mot11
     Reset Mot22
     Set Mot21
     Reset Mot22

     Mot1 = 190
     Mot2 = 170

     Elseif L1 < 700 And L2 < 700 And C < 700 And R1 < 700 And R2 < 700 Then

     Set Mot11
     Reset Mot12
     Set Mot22
     Reset Mot21

     Mot1 = 170
     Mot2 = 220

     R = 1
     U = 1
     End If

End If

If Pinb.0 = 0 Then
Flag = 3
End If

If Pinb.0 = 1 And Flag = 3 Then

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

Flag = 5
End If

If Pind.1 = 0 And Flag = 5 Then
Flag = 6
End If

If Pind.1 = 1 And Flag = 6 Then

     If R2 > 700 And A(f) = "r" Then

     Set Mot11
     Reset Mot12
     Set Mot22
     Reset Mot21

     Mot1 = 210
     Mot2 = 180
     F = F + 1

     Elseif C > 700 Then

     Set Mot11
     Reset Mot12
     Set Mot21
     Reset Mot22

     Mot1 = 200
     Mot2 = 190

       If A(f) = "s" Then
       F = F + 1
       End If

     Elseif L1 < 700 And L2 < 700 And C < 700 And R1 < 700 And R2 < 700 And A(f) = "l" Then

     Set Mot12
     Reset Mot11
     Set Mot21
     Reset Mot22

     Mot1 = 170
     Mot2 = 220
     F = F + 1

     Elseif R1 > 700 Then

     Set Mot11
     Reset Mot22
     Set Mot21
     Reset Mot22

     Mot1 = 190
     Mot2 = 170

     Elseif L1 > 700 Then

     Set Mot11
     Reset Mot12
     Set Mot21
     Reset Mot22

     Mot1 = 170
     Mot2 = 190

     End If

 End If

Loop
End