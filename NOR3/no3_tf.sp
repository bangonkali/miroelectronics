NOR 3 Input Test Bench

*********** define parameters *********** 
.PARAM LMIN=0.18u
.PARAM PVDD=1.8

* Input transition time.
.PARAM TRAN_TIME=0.25n

****** Anlysis Options **********
.option post
.op
.tran 1e-15 32n

***************** define stimulii ********************* 
Vdd ndd 0 PVDD
Va  a   0 pulse (PVDD 0  0 TRAN_TIME TRAN_TIME 2n 4n)
Vb  b   0 pulse (PVDD 0  0 TRAN_TIME TRAN_TIME 4n 8n)
Vc  c   0 pulse (PVDD 0  0 TRAN_TIME TRAN_TIME 8n 16n)

********* define main circuit ****************** 
Xnor2  ndd  0  a  b  c out  nor3
Cout   out  0  0.01f

********* load 0.35u library *********
.prot
.lib C:\synopsys\rf018.l TT
.include nor3.sp
.unprot

.end