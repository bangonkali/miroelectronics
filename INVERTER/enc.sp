****** SUBCIRCUIT DEFINITION: INVERTER
    .subckt inverter dd ss in out
        MN1 out in ss ss nch l='1*LMIN' w='2*LMIN'
        MP2 out in dd dd pch l='1*LMIN' w='6*LMIN'
    .ends
