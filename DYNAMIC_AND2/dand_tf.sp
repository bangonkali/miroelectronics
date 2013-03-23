2 INPUT DYNAMIC AND 

****** PARAMETER DEFINITION 
.PARAM LMIN=0.18u
.PARAM PVDD=1.8

****** ANALYSIS PARAMTERS
.option post
.op
.tran 1e-15 '128n'

****** STIMULI 
Vdd ndd 0 PVDD
Vin_a in_a  0 pulse (PVDD 0 0 0.25n 0.25n 16n 32n)
Vin_b in_b  0 pulse (PVDD 0 0 0.25n 0.25n 32n 64n)
Vclk  clk   0 pulse (PVDD 0 0 0.25n 0.25n 4n 8n)

****** MAIN CIRCUIT
Cout    out  0  0.01f
X_domino_and ndd 0 clk in_a in_b out domino_and

****** DOMINO AND 2 INPUT SUB CIRCUIT
.subckt domino_and dd ss clk a b out 
*** main ckt
MP1 w      clk dd    dd   pch l=LMIN w='2*LMIN'
MN1 w      a   ab    ss   nch l=LMIN w='2*LMIN'
MN2 ab     b   b_clk ss   nch l=LMIN w='2*LMIN'
MN3 b_clk  clk ss    ss   nch l=LMIN w='2*LMIN'

*** nand
MP2 out    w   dd    dd   pch l=LMIN w='2*LMIN'
MN4 out    w   ss    ss   nch l=LMIN w='2*LMIN'
.ends

****** LIBRARY
.prot
.lib "C:\synopsys\rf018.l" TT
.unprot

.end