****** SUBCIRCUIT DEFINITION: INVERTER
.subckt not ndd nss in out
    MN1 out in nss nss nch l='1*LMIN' w='2*LMIN'
    MP2 out in ndd ndd pch l='1*LMIN' w='6*LMIN'
.ends