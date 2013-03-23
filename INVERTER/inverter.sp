INVERTER

*********** define parameters *********** 
.PARAM LMIN=0.18u
.PARAM PVDD=1.8

****** Anlysis Options **********
.option post
.op
.dc Vin 0 1.8 1e-12
.tran 1e-15 8n

***************** define stimulii ********************* 
Vdd ndd 0 PVDD
Vin in  0 pulse (PVDD 0 0 0.5n 0.5n 1n 4n)

***** define global nodes for use in subcircuits ***** 
.global ndd

********* define main circuit ****************** 
X_cvsl  ndd 0 in out inverter
Cout    out  0  0.01f

*** define subcircuits (modules) ***** 
.subckt inverter ndd nss in out
    MN1 out in nss nss nch l='1*LMIN' w='2*LMIN'
    MP2 out in ndd ndd pch l='1*LMIN' w='6*LMIN'
.ends


********* load 0.35u library *********
.prot
.lib "C:\synopsys\rf018.l" TT
.unprot

.alter
    MP2 out in ndd ndd pch l='1*LMIN' w='2.2*LMIN'

.alter
    MP2 out in ndd ndd pch l='1*LMIN' w='6*LMIN'
    
.alter
    MP2 out in ndd ndd pch l='1*LMIN' w='9*LMIN'

.end