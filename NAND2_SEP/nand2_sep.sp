NAND 2 Input

*********** define parameters *********** 
.PARAM LMIN=0.18u
.PARAM PVDD=1.8

* Input transition time.
.PARAM TRAN_TIME=0.25n

****** Anlysis Options **********
.option post
.op
.tran 1e-15 16n

***************** define stimulii ********************* 
Vdd ndd 0 PVDD
Va  a   0 pulse (0    PVDD 0 TRAN_TIME TRAN_TIME 2n 4n)
Vb  b   0 pulse (PVDD 0    0 TRAN_TIME TRAN_TIME 4n 8n)

********* define main circuit ****************** 
Xnand  ndd  0  a  b  out  nand
Cout   out  0  0.01f

********* load 0.35u library *********
.prot
.lib C:\synopsys\rf018.l TT
.include nand2.lib
.unprot

.end