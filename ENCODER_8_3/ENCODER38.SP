****** SUBCIRCUIT DEFINITION: 8-3 ENCODER
.include NOR4.SP
.include NOT.SP
.subckt encoder dd ss a0 a1 a2 a3 a4 a5 a6 a7 z0 z1 z2
    Xnor4_0 dd ss a1 a3 a5 a7 not_z0 nor4
    Xnor4_1 dd ss a2 a3 a6 a7 not_z1 nor4
    Xnor4_2 dd ss a4 a5 a6 a7 not_z2 nor4
    Xnot_z0 dd ss not_z0 z0 not
    Xnot_z1 dd ss not_z1 z1 not
    Xnot_z2 dd ss not_z2 z2 not
.ends