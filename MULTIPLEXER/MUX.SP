****** SUBCIRCUIT DEFINITION: 4-1 MULTIPLEXER

.include NOT.SP
.include NOR4.SP
.include NAND3.SP

.subckt mux dd ss a0 a1 a2 a3 s0 s1 z
    Xnand3_a0 dd ss a0 not_s1 not_s0 n0 nand3
    Xnand3_a1 dd ss a1 not_s1 s0     n1 nand3
    Xnand3_a2 dd ss a2 s1     not_s0 n2 nand3
    Xnand3_a3 dd ss a3 s1     s0     n3 nand3
    
    xnot_n0 dd ss n0 not_n0 not
    xnot_n1 dd ss n1 not_n1 not
    xnot_n2 dd ss n2 not_n2 not
    xnot_n3 dd ss n3 not_n3 not
    
    xnot_s0 dd ss s0 not_s0 not
    xnot_s1 dd ss s1 not_s1 not
    
    xnor4 dd ss not_n0 not_n1 not_n2 not_n3 not_z nor4
    
    xnot_z0 dd ss not_z z   not
.ends