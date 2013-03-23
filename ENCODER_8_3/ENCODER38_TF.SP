encoder 8-3
*http://www.asic-world.com/digital/combo3.html

****** SIMULATION PARAMETERS
.PARAM LMIN=0.18u
.PARAM PVDD=1.8

* Input transition time.
.PARAM TRAN_TIME=0.25n
.PARAM MINTIME=2n

****** ANALYSIS OPTIONS
.option post
.op
.tran 1e-15 'MINTIME*9'

****** STIMULI 
Vdd ndd 0 PVDD
Va0  in_a0   0 pulse ( 0 PVDD 0           TRAN_TIME TRAN_TIME MINTIME 'MINTIME*8')
Va1  in_a1   0 pulse ( 0 PVDD 'MINTIME*1' TRAN_TIME TRAN_TIME MINTIME 'MINTIME*8')
Va2  in_a2   0 pulse ( 0 PVDD 'MINTIME*2' TRAN_TIME TRAN_TIME MINTIME 'MINTIME*8')
Va3  in_a3   0 pulse ( 0 PVDD 'MINTIME*3' TRAN_TIME TRAN_TIME MINTIME 'MINTIME*8')
Va4  in_a4   0 pulse ( 0 PVDD 'MINTIME*4' TRAN_TIME TRAN_TIME MINTIME 'MINTIME*8')
Va5  in_a5   0 pulse ( 0 PVDD 'MINTIME*5' TRAN_TIME TRAN_TIME MINTIME 'MINTIME*8')
Va6  in_a6   0 pulse ( 0 PVDD 'MINTIME*6' TRAN_TIME TRAN_TIME MINTIME 'MINTIME*8')
Va7  in_a7   0 pulse ( 0 PVDD 'MINTIME*7' TRAN_TIME TRAN_TIME MINTIME 'MINTIME*8')

****** TEST BENCH CIRCUIT
Cz0 out_z0 ss 0.01f
Cz1 out_z1 ss 0.01f
Cz2 out_z2 ss 0.01f
Xencoder ndd 0 in_a0 in_a1 in_a2 in_a3 in_a4 in_a5 in_a6 in_a7 out_z0 out_z1 out_z2 encoder 

****** LOAD EXTERNAL FILES
.lib C:\synopsys\rf018.l TT
.include ENCODER38.SP
.end