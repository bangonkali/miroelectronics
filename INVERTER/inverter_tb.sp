INVERTER TEST BENCH

****** SIMULATION PARAMETERS
.PARAM LMIN=0.18u
.PARAM PVDD=1.8
.PARAM TRAN_TIME=0.25n

****** ANALYSIS OPTIONS
.option post
.op
.tran 1e-15 8n

****** STIMULI
Vdd ndd  0 PVDD
Vin in_x 0 pulse (PVDD 0 0 TRAN_TIME TRAN_TIME 2n 4n)

****** TEST BENCH CIRCUIT
X_inverter ndd    0  in_x     out_z inverter
Cout       out_z  0  0.01f

****** LOAD EXTERNAL FILES
.prot
.lib "C:\synopsys\rf018.l" TT
.include "inverter.cir"
.unprot

.end