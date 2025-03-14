ClrHome
Disp "UNIT CIRCLE"
Disp "------------"
Disp "1:ANGLE VALUES"
Disp "2:REF ANGLES"
Disp "3:CONVERSION"
Disp "4:BACK"
Input "SELECT: ",A

If A=4
Then
  prgmTRIGMAIN
End

If A=1
Then
  // Unit circle values
  ClrHome
  Disp "ANGLE VALUES"
  Disp "------------"
  Disp "1:0° / 0"
  Disp "2:30° / π/6"
  Disp "3:45° / π/4"
  Disp "4:60° / π/3"
  Disp "5:90° / π/2"
  Disp "6:MORE..."
  Input "",B
  
  ClrHome
  If B=1
  Then
    Disp "0° / 0 rad"
    Disp "------------"
    Disp "sin(0)=0"
    Disp "cos(0)=1"
    Disp "tan(0)=0"
    Disp "csc(0)=undef"
    Disp "sec(0)=1"
    Disp "cot(0)=undef"
    Pause
  End
  // Other angles similar structure
End

If A=2
Then
  // Reference angle calculator
  ClrHome
  Disp "REFERENCE ANGLE"
  Input "ANGLE IN DEG: ",θ
  
  // Convert to 0-360 range
  While θ<0
    θ+360→θ
  End
  While θ≥360
    θ-360→θ
  End
  
  // Calculate reference angle
  If θ≤90
  Then
    θ→R
  Else
    If θ≤180
    Then
      180-θ→R
    Else
      If θ≤270
      Then
        θ-180→R
      Else
        360-θ→R
      End
    End
  End
  
  ClrHome
  Disp "ANGLE:",θ,"°"
  Disp "REF ANGLE:",R,"°"
  Disp "QUADRANT:",1+int((θ)/90)
  Disp "------------"
  Disp "1:SHOW WORK"
  Disp "2:NEW ANGLE"
  Disp "3:BACK"
  // Handle inputs and continue
End

// More options...

Goto MAIN
