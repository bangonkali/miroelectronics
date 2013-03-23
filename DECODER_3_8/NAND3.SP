****** SUBCIRCUIT DEFINITION: 2 INPUT NAND
.subckt nand3 dd ss a b c out
    MN1 out a   ab   ss  nch l='1*LMIN' w='2*LMIN'
    MN2 ab  b   bc   ss  nch l='1*LMIN' w='2*LMIN'
    MN3 bc  c   ss   ss  nch l='1*LMIN' w='2*LMIN'
    
    MP1 out a   dd   dd  pch l='1*LMIN' w='6*LMIN'
    MP2 out b   dd   dd  pch l='1*LMIN' w='6*LMIN'
    MP3 out c   dd   dd  pch l='1*LMIN' w='6*LMIN'
.ends

