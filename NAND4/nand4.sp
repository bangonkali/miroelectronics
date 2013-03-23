****** SUBCIRCUIT DEFINITION: 4 INPUT NAND
.subckt nand4 dd ss a b c d out
    MN1 out a   ab   ss  nch l='1*LMIN' w='2*LMIN'
    MN2 ab  b   bc   ss  nch l='1*LMIN' w='2*LMIN'
    MN3 bc  c   cd   ss  nch l='1*LMIN' w='2*LMIN'
    MN4 cd  d   ss   ss  nch l='1*LMIN' w='2*LMIN'
    
    MP1 out a   dd   dd  pch l='1*LMIN' w='6*LMIN'
    MP2 out b   dd   dd  pch l='1*LMIN' w='6*LMIN'
    MP3 out c   dd   dd  pch l='1*LMIN' w='6*LMIN'
    MP4 out d   dd   dd  pch l='1*LMIN' w='6*LMIN'
.ends