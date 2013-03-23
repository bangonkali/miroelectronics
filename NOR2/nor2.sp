*** define subcircuits (modules) ***** 
.subckt nor2 dd ss a b out
    MPA ab  a   dd   dd  pch l='1*LMIN' w='6*LMIN'
    MPB out b   ab   dd  pch l='1*LMIN' w='6*LMIN'

    MNA out a   ss   ss  nch l='1*LMIN' w='2*LMIN'
    MNB out b   ss   ss  nch l='1*LMIN' w='2*LMIN'
.ends