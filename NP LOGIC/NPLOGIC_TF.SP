NP LOGIC SIMULATION

****** PARAMETER DEFINITION 
.PARAM LMIN=0.18u
.PARAM PVDD=1.8

****** ANALYSIS PARAMTERS
.option post
.op
.tran 1e-12 '512n'

****** STIMULI 
Vdd ndd 0 PVDD
Vin_a in_a  0 pulse (PVDD 0 0 0.1n 0.1n 16n 32n)
Vin_b in_b  0 pulse (PVDD 0 0 0.1n 0.1n 32n 64n)
Vin_y in_y  0 pulse (PVDD 0 0 0.1n 0.1n 64n 128n)
Vin_f in_f  0 pulse (PVDD 0 0 0.1n 0.1n 128n 256n)
Vin_h in_h  0 pulse (PVDD 0 0 0.1n 0.1n 256n 512n)
Vclk  clk   0 pulse (PVDD 0 0 0.1n 0.1n 4n 8n)

****** MAIN CIRCUIT
X_nplogic ndd 0 clk in_a in_b in_y in_f in_h out nplogic

****** DOMINO AND 2 INPUT SUB CIRCUIT
.subckt nplogic dd ss clk a b y f h out
*** main ckt

Cout    out  ss  40f
Cg      g    ss  35f
Cx      x    ss  35f

x_clki dd ss clk clki inverter

MP1 x      clk  dd    dd   pch l=LMIN w='6*LMIN'
MN1 x      a    ab    ss   nch l=LMIN w='2*LMIN'
MN2 ab     b    dx    ss   nch l=LMIN w='2*LMIN'
MN3 dx     clk  ss    ss   nch l=LMIN w='2*LMIN'

MP2 xy     clki dd    dd   pch l=LMIN w='6*LMIN'
MP5 g      x    xy    dd   pch l=LMIN w='6*LMIN'
MP6 g      y    xy    dd   pch l=LMIN w='6*LMIN'
MN4 g      clki ss    ss   nch l=LMIN w='2*LMIN'

MP3 out    clk  dd    dd   pch l=LMIN w='6*LMIN'
MN5 out    f    fg    ss   nch l=LMIN w='2*LMIN'
MN6 fg     g    dout  ss   nch l=LMIN w='2*LMIN'
MN7 out    h    dout  ss   nch l=LMIN w='2*LMIN'
MN8 dout   clk  ss    ss   nch l=LMIN w='2*LMIN'
.ends

****** INVERTER CIRCUIT
.subckt inverter ndd nss in out
    MN1 out in nss nss nch l='1*LMIN' w='2*LMIN'
    MP2 out in ndd ndd pch l='1*LMIN' w='6*LMIN'
.ends

****** LIBRARY
.prot
.lib "C:\synopsys\rf018.l" TT
.unprot

.end