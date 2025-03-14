ClrHome
Disp "ADVANCED TRIG"
Disp "LOADING..."

// Initialize configuration
prgmTRIGCONF

Lbl MAIN
ClrHome
Disp "TRIG MASTER"
Disp "============="
// Menu generation from lists
For(I,1,dim(L1))
  Output(I+2,1,toString(I))
  Output(I+2,3,L1(I))
End

Disp ""
Disp "0:EXIT"
Input "SELECT: ",A

// Process selection
If A=0
Then
  ClrHome
  Stop
End

// Check if valid option
If A≤dim(L1)
Then
  // L2 stores the corresponding program names
  prgm→L2(A)
Else
  Goto MAIN
End
