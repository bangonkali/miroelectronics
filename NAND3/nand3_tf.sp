3 INPUT NAND TEST BENCH

****** SIMULATION PARAMETERS
.PARAM LMIN=0.18u
.PARAM PVDD=1.8

* Input transition time.
.PARAM TRAN_TIME=0.25n

****** ANALYSIS OPTIONS
.option post
.op
.tran 1e-15 32n

****** STIMULI 
Vdd ndd 0 PVDD
Va  a   0 pulse (PVDD 0 4n TRAN_TIME TRAN_TIME 2n 4n )
Vb  b   0 pulse (PVDD 0 4n TRAN_TIME TRAN_TIME 4n 8n )
Vc  c   0 pulse (PVDD 0 4n TRAN_TIME TRAN_TIME 8n 16n)

****** TEST BENCH CIRCUIT
Xnand3  ndd  0  a  b  c  out  nand3
Cout    out  0  0.01f

****** LOAD EXTERNAL FILES
.prot
.lib "C:\synopsys\rf018.l" TT
.include "nand3.sp"
.unprot

.end