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



'$regfile = "m16def.dat"
'$crystal = 8000000
'$hwstack = 40
'$swstack = 16
'$framesize = 32

'Declare Function Rc(byval I As Integer , R1 As Integer , R2 As Integer , R3 As Integer , R4 As Integer) As Single       'Declare Function Rc(byval I As Integer , R1 As Integer , R2 As Integer) As Integer

'Dim S1 As Integer , S2 As Integer , L1 As Integer , L2 As Integer , Value As Single , Ip As Integer , Sps As Integer
'Declare Function Spdmap(byval I As Integer , Byval R1 As Integer , Byval R2 As Integer) As Byte

'L1 = 500 : L2 = 1000 : S1 = 255 : S2 = 0
' Do

'    Input "Enter ur value u want to Find :" , Ip
'    Value = Rc(ip , S1 , S2 , L1 , L2)
'    Print Value

'Loop
'End

'*************** Funtion of Large Range Convertion*****************
'Function Rc(byval I As Integer , R1 As Integer , R2 As Integer) As Integer

'Dim M As Integer , Range As Single
'M = 255

'      Range = R2 - R1
'      Range = M / Range
'      Range = I / Range
'      Range = R1 + Range

'      Rc = Range
'End Function

'Function Rc(byval I As Integer , R1 As Integer , R2 As Integer , R3 As Integer , R4 As Integer) As Single

'Dim Range As Single , A4 As Integer , A2 As Integer

'      A2 = R2 - R1
'      A4 = R4 - R3
'      Range = A4 / A2
'      I = I - R3
'      Range = I / Range
'      Range = R1 + Range
'      Rc = Range

'End Function

'***************Funtion of Range Convertion*****************
'Function Rc(byval I As Integer , R1 As Integer , R2 As Integer) As Integer

'Dim M As Integer , Range As Single
'M = 1000

'      Range = R2 - R1
'      Range = M / Range
'      Range = I / Range
'      Range = R1 + Range

'      Rc = Range
'End Function

'*************** FUNCTION FOR MAPPING SPD *****************
'Function Spdmap(i As Integer , R1 As Integer , R2 As Integer) As Byte

'Dim Ranges As Single , Ar3 As Integer , Ar4 As Integer

'      Ar4 = 255
'      Ar3 = R2 - R1
'      Ranges = Ar3 / Ar4
'      I = I - R1
'      Ranges = I / Ranges
'      Spdmap = Ranges

'End Function