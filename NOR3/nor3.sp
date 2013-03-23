*** define subcircuits (modules) ***** 
.subckt nor3 dd ss a b c out
    MPA ab  a   dd   dd  pch l='1*LMIN' w='6*LMIN'
    MPB bc  b   ab   dd  pch l='1*LMIN' w='6*LMIN'
    MPC out c   bc   dd  pch l='1*LMIN' w='6*LMIN'
    
    MNA out a   ss   ss  nch l='1*LMIN' w='2*LMIN'
    MNB out b   ss   ss  nch l='1*LMIN' w='2*LMIN'
    MNC out c   ss   ss  nch l='1*LMIN' w='2*LMIN'
.ends