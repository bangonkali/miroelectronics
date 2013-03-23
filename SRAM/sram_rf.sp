SRAM SINGLE CELL SIMULATION

****** PARAMETER DEFINITION 
.PARAM LMIN=0.18u
.PARAM PVDD=1.8
.PARAM RFTIME=0.1n

****** ANALYSIS PARAMTERS
.option post
.op
.tran 1e-12 '16n'

****** STIMULI 
Vdd ndd 0 PVDD
Vin_bb nbb  0 pulse (PVDD 0    0 RFTIME RFTIME 8n 16n)
Vin_ww nww  0 pulse (0    PVDD 0 RFTIME RFTIME 2n 04n)

Co_bb n_obb 0 1f
Co_bn n_obn 0 1f

****** MAIN CIRCUIT : SINGLE SRAM CELL SIMULATION
X_sram_cell ndd 0 nww nbb n_obb n_obn sram_cell

****** SRAM CELL
.subckt sram_cell dd ss ww bb obb obn   

x_inverter dd ss bb bn inverter

MP1 obb      obn       dd        dd    pch l=LMIN w='6*LMIN'
MP2 obn      obb       dd        dd    pch l=LMIN w='6*LMIN'

MN1 obb      obn       ss        ss    nch l=LMIN w='2*LMIN'
MN2 obn      obb       ss        ss    nch l=LMIN w='2*LMIN'

MN4 bb       ww        obb       ss    nch l=LMIN w='3*LMIN'
MN3 bn       ww        obn       ss    nch l=LMIN w='3*LMIN'
.ends

****** INVERTER CELL
.subckt inverter ndd nss in out
    MN1 out in nss nss nch l='1*LMIN' w='2*LMIN'
    MP2 out in ndd ndd pch l='1*LMIN' w='6*LMIN'
.ends

****** LIBRARY
.prot
.lib "C:\synopsys\rf018.l" TT
.unprot

.end