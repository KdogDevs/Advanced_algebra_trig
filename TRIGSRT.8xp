ClrHome
Disp "SPECIAL RIGHT"
Disp "TRIANGLES"
Disp "------------"
Disp "1:30-60-90"
Disp "2:45-45-90"
Disp "3:BACK TO MENU"
Input "SELECT: ",A

If A=3
Then
  prgmTRIGMAIN
End

If A=1
Then
  Lbl TRI3060
  ClrHome
  Disp "30°-60°-90°"
  Disp "SIDES 1:√3:2"
  Disp "------------"
  Disp "KNOWN VALUE:"
  Disp "1:SHORT LEG"
  Disp "2:LONG LEG"
  Disp "3:HYPOTENUSE"
  Input "",B
  
  ClrHome
  Disp "30°-60°-90°"
  Disp "------------"
  
  If B=1
  Then
    Input "SHORT LEG=",S
    Disp "SHORT LEG=",S
    Disp "LONG LEG=",S*√(3)
    Disp "HYPOTENUSE=",2*S
    Disp "------------"
    Disp "1:SHOW WORK"
    Disp "2:BACK"
    Input "",C
    If C=1
    Then
      ClrHome
      Disp "IN 30-60-90:"
      Disp "LONG=SHORT×√3"
      Disp "LONG=",S,"×√3"
      Disp "LONG=",S*√(3)
      Disp "HYPO=2×SHORT"
      Disp "HYPO=2×",S
      Disp "HYPO=",2*S
      Pause 
    End
  End
  // Similar blocks for options 2 and 3
End

If A=2
Then
  // 45-45-90 Triangle implementation
  // Similar structure to 30-60-90
End

Goto MAIN
