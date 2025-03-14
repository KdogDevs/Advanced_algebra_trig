ClrHome
Disp "TRIG FUNCTIONS"
Disp "------------"
Disp "1:CALCULATE ALL"
Disp "2:COFUNCTIONS"
Disp "3:EXACT VALUES"
Disp "4:BACK"
Input "SELECT: ",A

If A=4
Then
  prgmTRIGMAIN
End

If A=1
Then
  // Calculate all trig functions
  ClrHome
  Disp "CALC ALL TRIG"
  Disp "1:DEGREES"
  Disp "2:RADIANS"
  Input "MODE: ",M
  
  ClrHome
  If M=1
  Then
    Input "ANGLE (DEG): ",θ
    Disp "ANGLE:",θ,"°"
  Else
    Input "ANGLE (RAD): ",θ
    Disp "ANGLE:",θ," rad"
  End
  
  If M=1
  Then
    sin(θ)→S
    cos(θ)→C
    tan(θ)→T
  Else
    sin(θ)→S
    cos(θ)→C
    tan(θ)→T
  End
  
  ClrHome
  Disp "sin(",θ,")=",S
  Disp "cos(",θ,")=",C
  Disp "tan(",θ,")=",T
  If S≠0 and C≠0 and T≠0
  Then
    Disp "csc(",θ,")=",1/S
    Disp "sec(",θ,")=",1/C
    Disp "cot(",θ,")=",1/T
  Else
    Disp "RECIPROCALS:"
    Disp "UNDEFINED FOR 0"
  End
  
  Disp "1:REFERENCE INFO"
  Disp "2:BACK"
  Input "",B
  
  If B=1
  Then
    ClrHome
    Disp "RELATIONSHIPS:"
    Disp "sin(θ)=1/csc(θ)"
    Disp "cos(θ)=1/sec(θ)"
    Disp "tan(θ)=sin/cos"
    Disp "cot(θ)=cos/sin"
    Disp "sin²+cos²=1"
    Pause
  End
End

// Other options similarly structured

Goto MAIN
