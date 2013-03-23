3-8 DECODER TEST BENCH
*http://coep.vlab.co.in/?sub=28&brch=81&sim=609&cnt=1

****** SIMULATION PARAMETERS
.PARAM LMIN=0.18u
.PARAM PVDD=1.8

* Input transition time.
.PARAM TRAN_TIME=0.25n

****** ANALYSIS OPTIONS
.option post
.op
.tran 1e-15 '32n + (8*TRAN_TIME)'

****** STIMULI 
Vdd ndd 0 PVDD
Va0  in_a0   0 pulse (PVDD 0  0 TRAN_TIME TRAN_TIME 2n  4n)
Va1  in_a1   0 pulse (PVDD 0  0 TRAN_TIME TRAN_TIME 4n  8n)
Va2  in_a2   0 pulse (PVDD 0  0 TRAN_TIME TRAN_TIME 8n  16n)

****** TEST BENCH CIRCUIT
Cz0 out_z0 ss 0.01f
Cz1 out_z1 ss 0.01f
Cz2 out_z2 ss 0.01f
Cz3 out_z3 ss 0.01f
Cz4 out_z4 ss 0.01f
Cz5 out_z5 ss 0.01f
Cz6 out_z6 ss 0.01f
Cz7 out_z7 ss 0.01f
Xdecoder ndd 0 in_a0 in_a1 in_a2 out_z0 out_z1 out_z2 out_z3 out_z4 out_z5 out_z6 out_z7 decoder

****** LOAD EXTERNAL FILES
.lib C:\synopsys\rf018.l TT
.include DECODER38.SP
.end