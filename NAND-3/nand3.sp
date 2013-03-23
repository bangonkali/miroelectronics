NAND 2 Input

*********** define parameters *********** 
.PARAM LMIN=0.18u
.PARAM PVDD=1.8

* Input transition time.
.PARAM TRAN_TIME=0.25n

****** Anlysis Options **********
.option post
.op
.tran 1e-15 20n

***************** define stimulii ********************* 
Vdd ndd 0 PVDD
Va  a   0 pulse (PVDD 0 4n TRAN_TIME TRAN_TIME 2n 4n )
Vb  b   0 pulse (PVDD 0 4n TRAN_TIME TRAN_TIME 4n 8n )
Vc  c   0 pulse (PVDD 0 4n TRAN_TIME TRAN_TIME 8n 16n)

********* define main circuit ****************** 
Xnand  ndd  0  a  b  c  out  nand
Cout   out  0  0.01f

*** define subcircuits (modules) ***** 
.subckt nand dd ss a b c out
    MN1 out a   ab   ss  nch l='1*LMIN' w='2*LMIN'
    MN2 ab  b   bc   ss  nch l='1*LMIN' w='2*LMIN'
    MN3 bc  c   ss   ss  nch l='1*LMIN' w='2*LMIN'
    
    MP1 out a   dd   dd  pch l='1*LMIN' w='36*LMIN'
    MP2 out b   dd   dd  pch l='1*LMIN' w='36*LMIN'
    MP3 out c   dd   dd  pch l='1*LMIN' w='36*LMIN'
.ends


********* load 0.35u library *********
.prot
.lib "C:\synopsys\rf018.l" TT
.unprot

.alter
    MP1 out a   dd   dd  pch l='1*LMIN' w='6*LMIN'
    MP2 out b   dd   dd  pch l='1*LMIN' w='6*LMIN'
    MP3 out c   dd   dd  pch l='1*LMIN' w='6*LMIN'

.end