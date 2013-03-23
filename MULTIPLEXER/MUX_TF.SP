4 TO 1 MULTIPLEXER
****** REFERENCE:
****** http://www.asic-world.com/digital/combo3.html

****** SIMULATION PARAMETERS
.PARAM LMIN=0.18u
.PARAM PVDD=1.8

* Input transition time.
.PARAM TRAN_TIME=0.25n
.PARAM MINTIME=2n

****** ANALYSIS OPTIONS
.option post
.op
.tran 1e-15 128n

****** STIMULI
Vdd ndd 0 PVDD
Va0  in_a0   0 pulse (PVDD 0  0 TRAN_TIME TRAN_TIME 2n  4n)
Va1  in_a1   0 pulse (PVDD 0  0 TRAN_TIME TRAN_TIME 4n  8n)
Va2  in_a2   0 pulse (PVDD 0  0 TRAN_TIME TRAN_TIME 8n  16n)
Va3  in_a3   0 pulse (PVDD 0  0 TRAN_TIME TRAN_TIME 16n 32n)

Vs0  in_s0   0 pulse (PVDD 0  0 TRAN_TIME TRAN_TIME 32n 64n)
Vs1  in_s1   0 pulse (PVDD 0  0 TRAN_TIME TRAN_TIME 64n 128n)

****** TEST BENCH CIRCUIT
Cz0 out_z ss 0.01f
Xmux ndd 0 in_a0 in_a1 in_a2 in_a3 in_s0 in_s1 out_z mux

****** LOAD EXTERNAL FILES
.lib C:\synopsys\rf018.l TT
.include MUX.SP
.end