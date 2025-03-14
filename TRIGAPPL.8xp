ClrHome
Disp "APPLICATIONS"
Disp "------------"
Disp "1:ANGLE ELEVATION"
Disp "2:ANGLE DEPRESSION"
Disp "3:ARC LENGTH"
Disp "4:SECTOR AREA"
Disp "5:BACK"
Input "SELECT: ",A

If A=5
Then
  prgmTRIGMAIN
End

If A=1
Then
  // Angle of elevation
  ClrHome
  Disp "ANGLE ELEVATION"
  Disp "------------"
  Disp "KNOWN VALUES:"
  Input "DISTANCE: ",D
  Input "ANGLE (DEG): ",θ
  
  // Calculate height
  D*tan(θ)→H
  
  ClrHome
  Disp "RESULTS:"
  Disp "------------"
  Disp "DISTANCE:",D
  Disp "ANGLE:",θ,"°"
  Disp "HEIGHT:",H
  
  Disp "1:SHOW WORK"
  Disp "2:BACK"
  Input "",B
  
  If B=1
  Then
    ClrHome
    Disp "USING TAN(θ):"
    Disp "tan(θ)=opp/adj"
    Disp "tan(",θ,")=H/",D
    Disp "H=",D,"×tan(",θ,")"
    Disp "H=",D,"×",tan(θ)
    Disp "H=",H
    Pause
  End
End

// Other applications similarly structured

Goto MAIN
