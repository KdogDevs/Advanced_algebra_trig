ClrHome
Disp "NOTES & REF"
Disp "------------"
Disp "1:VIEW NOTES"
Disp "2:ADD NOTE"
Disp "3:FORMULAS"
Disp "4:BACK"
Input "SELECT: ",A

If A=4
Then
  prgmTRIGMAIN
End

If A=1 and N>0
Then
  // View saved notes
  ClrHome
  Disp "SAVED NOTES:"
  Disp "------------"
  For(I,1,N)
    Disp I,":",Str1(I)
  End
  Disp "------------"
  Input "SELECT # (0=BACK): ",B
  If B>0 and B≤N
  Then
    ClrHome
    Disp "NOTE #",B
    Disp "------------"
    Disp Str1(B)
    Disp Str2(B)
    Disp "------------"
    Pause
  End
End

If A=2
Then
  // Add new note
  N+1→N
  ClrHome
  Disp "NEW NOTE #",N
  Disp "------------"
  Input "TITLE: ",Str1(N)
  Input "CONTENT: ",Str2(N)
  Disp "NOTE SAVED!"
  Pause
End

If A=3
Then
  // Formula reference
  ClrHome
  Disp "FORMULAS"
  Disp "------------"
  Disp "1:BASIC IDENTITIES"
  Disp "2:LAW OF SINES"
  Disp "3:LAW OF COSINES"
  Disp "4:BACK"
  Input "",C
  
  If C=1
  Then
    ClrHome
    Disp "BASIC IDENTITIES"
    Disp "------------"
    Disp "sin²(θ)+cos²(θ)=1"
    Disp "tan(θ)=sin(θ)/cos(θ)"
    Disp "cot(θ)=cos(θ)/sin(θ)"
    Disp "sin(A±B)="
    Disp "sinAcosB±cosAsinB"
    Disp "cos(A±B)="
    Disp "cosAcosB∓sinAsinB"
    Pause
  End
  // Other formulas similarly structured
End

Goto MAIN
