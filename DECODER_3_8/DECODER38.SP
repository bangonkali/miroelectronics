****** SUBCIRCUIT DEFINITION: 3-8 DECODER

.include NAND3.SP
.include NOT.SP

.subckt decoder dd ss a0 a1 a2 z0 z1 z2 z3 z4 z5 z6 z7 
Xnot0    dd  ss  a0     not_a0  not
Xnot1    dd  ss  a1     not_a1  not
Xnot2    dd  ss  a2     not_a2  not

Xnot_z0  dd  ss  not_z0 z0      not
Xnot_z1  dd  ss  not_z1 z1      not
Xnot_z2  dd  ss  not_z2 z2      not
Xnot_z3  dd  ss  not_z3 z3      not
Xnot_z4  dd  ss  not_z4 z4      not
Xnot_z5  dd  ss  not_z5 z5      not
Xnot_z6  dd  ss  not_z6 z6      not
Xnot_z7  dd  ss  not_z7 z7      not

Xnand3_0 dd  ss  not_a0 not_a1 not_a2 not_z0 nand3
Xnand3_1 dd  ss  a0     not_a1 not_a2 not_z1 nand3
Xnand3_2 dd  ss  not_a0 a1     not_a2 not_z2 nand3
Xnand3_3 dd  ss  a0     a1     not_a2 not_z3 nand3

Xnand3_4 dd  ss  not_a0 not_a1 a2     not_z4 nand3
Xnand3_5 dd  ss  a0     not_a1 a2     not_z5 nand3
Xnand3_6 dd  ss  not_a0 a1     a2     not_z6 nand3
Xnand3_7 dd  ss  a0     a1     a2     not_z7 nand3

.ends