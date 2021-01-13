$regfile = "m16def.dat"
$crystal = 4000000
$hwstack = 40
$swstack = 16
$framesize = 32



Config Lcdpin = Pin , Db4 = Portc.4 , Db5 = Portc.5 , Db6 = Portc.6 , Db7 = Portc.7 , E = Portc.1 , Rs = Portc.0
Dim A As Integer
Dim I As Integer


Config Lcd = 16 * 2

Do


  For A = -4 To 16
    I = A + 1

      Waitms 50
      Cls

     Locate 1 , I : Lcd "MOHIT"
      Waitms 50



       If I > 16 Then
        Exit For

       End If



  Next To A
    For A = -4 To 16
    I = A + 1


      Waitms 50
      Cls

     Locate 2 , I : Lcd "MOHIT"
      Waitms 50


       If I > 16 Then
        Exit For

       End If



  Next To A

Loop
End