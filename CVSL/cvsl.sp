CVSL

.PARAM LMIN=0.18u
.PARAM WFACTOR=1.4
.PARAM WMIN='LMIN*WFACTOR'

.lib "C:\synopsys\rf018.l" TT

.global vdd
.option post

Cout_z  Z  0  100f
Cout_!z Z! 0  100f

Vdd vdd 0 1.8

Vin_a  in_a  0 pulse (1.8 0 0 0 0 200n 400n)
Vin_b  in_b  0 pulse (1.8 0 0 0 0 400n 800n)
Vin_c  in_c  0 pulse (1.8 0 0 0 0 800n 1600n)

Vin_!a in_!a 0 pulse (0 1.8 0 0 0 200n 400n)
Vin_!b in_!b 0 pulse (0 1.8 0 0 0 400n 800n)
Vin_!c in_!c 0 pulse (0 1.8 0 0 0 800n 1600n)

X_cvsl in_a in_b in_c in_!a in_!b in_!c Z Z! cvsl

.subckt cvsl in_a in_b in_c in_!a in_!b in_!c Z Z!
    MN1 Z! in_b    K   0   nch l=LMIN w='WMIN*2'
    MN2 Z! in_!a   0   0   nch l=LMIN w=WMIN
    MN3 K  in_c    0   0   nch l=LMIN w='WMIN*2'
    
    MN4 J  in_!b   0   0   nch l=LMIN w=WMIN
    MN5 Z  in_a    J   0   nch l=LMIN w='WMIN*2'
    MN6 J  in_!c   0   0   nch l=LMIN w=WMIN
    
    MP1 Z  Z!      vdd vdd pch l=LMIN w='WMIN*1'
    MP2 Z! Z       vdd vdd pch l=LMIN w='WMIN*1'
.ends

.op
.tran 1p 1600n

.end