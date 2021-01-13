$regfile = "m16def.dat"
$crystal = 8000000
$hwstack = 40
$swstack = 16
$framesize = 32
Declare Function Funmap(i As Single , R1 As Integer , R2 As Single , R3 As Integer , R4 As Integer) As Integer
Declare Function Map(i As Single , R1 As Integer , R2 As Integer , R3 As Integer , R4 As Single) As Single

Dim S As Single , A As Integer , B As Single , C As Integer , D As Integer , Ans As Integer
A = 0 : B = 1023 : C = 0 : D = 255
  Print "Range is " + A + "-" + B + " & " + C + "-" + D
 Do
   Input "Input : " , S
   Ans = Funmap(s , A , B , C , D ) : Print Ans
Loop
End

'*************** FUNCTION FOR MAPPING RANGE USING TRIGONOMETRY FUNTION*****************
Function Funmap(i As Single , R1 As Integer , R2 As Single , R3 As Integer , R4 As Integer) As Integer

  Dim Fun As Single , Minangle As Integer , Maxangle As Integer , Minrange As Integer , Maxrange As Single
  Minangle = -90 : Maxangle = 90 : Minrange = -1 : Maxrange = 0.99999
       Fun = Map(i , Minangle , Maxangle , R1 , R2) : Fun = Deg2rad(fun) : Fun = Sin(fun) : Fun = Map(fun , R3 , R4 , Minrange , Maxrange)
       Funmap = Fun
End Function

'*************** FUNCTION FOR MAPPING RANGE *****************
Function Map(i As Single , R1 As Integer , R2 As Integer , R3 As Integer , R4 As Single) As Single

Dim Range As Single , Ar1 As Single , Ar2 As Single
      Ar2 = R2 - R1 : Ar1 = R4 - R3 : Range = Ar1 / Ar2
      I = I - R3 : Range = I / Range : Range = R1 + Range
      Map = Range

End Function


