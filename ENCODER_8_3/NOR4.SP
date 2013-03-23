****** SUBCIRCUIT DEFINITION: 4 INPUT NOR
.subckt nor4 dd ss a b c d out
    MPA ab  a   dd   dd  pch l='1*LMIN' w='6*LMIN'
    MPB bc  b   ab   dd  pch l='1*LMIN' w='6*LMIN'
    MPC cd  c   bc   dd  pch l='1*LMIN' w='6*LMIN'
    MPD out d   cd   dd  pch l='1*LMIN' w='6*LMIN'
    
    MNA out a   ss   ss  nch l='1*LMIN' w='2*LMIN'
    MNB out b   ss   ss  nch l='1*LMIN' w='2*LMIN'
    MNC out c   ss   ss  nch l='1*LMIN' w='2*LMIN'
    MND out d   ss   ss  nch l='1*LMIN' w='2*LMIN'
    
.ends