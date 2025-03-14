ClrHome
Disp "RIGHT TRIANGLE"
Disp "SOLVER"
Disp "------------"
Disp "ENTER 2 VALUES:"
Disp "1:LEG-LEG"
Disp "2:LEG-ANGLE"
Disp "3:HYPOTENUSE-LEG"
Disp "4:HYPOTENUSE-ANGLE"
Disp "5:BACK"
Input "SELECT: ",A

If A=5
Then
  prgmTRIGMAIN
End

If A=1
Then
  // Leg-Leg
  ClrHome
  Disp "LEG-LEG"
  Input "LEG A=",L1
  Input "LEG B=",L2
  
  // Calculate
  √(L1²+L2²)→H
  
  // Display results
  ClrHome
  Disp "RESULTS:"
  Disp "------------"
  Disp "LEG A=",L1
  Disp "LEG B=",L2
  Disp "HYPOTENUSE=",H
  Disp "ANGLE A=",round(invTan(L2/L1),4),"°"
  Disp "ANGLE B=",round(invTan(L1/L2),4),"°"
  Disp "AREA=",round(L1*L2/2,4)
  
  Disp "1:SHOW WORK"
  Disp "2:BACK"
  Input "",C
  
  If C=1
  Then
    ClrHome
    Disp "PYTHAGOREAN:"
    Disp "c²=a²+b²"
    Disp "c²=",L1,"²+",L2,"²"
    Disp "c²=",L1²+L2²
    Disp "c=",H
    Disp ""
    Disp "tan(A)=opp/adj"
    Disp "tan(A)=",L2,"/",L1
    Disp "A=",round(invTan(L2/L1),4),"°"
    Pause
  End
End
// Other options similarly structured

Goto MAIN
