PMOS SIMULATION

* LEVEL 1 ENHANCEMENT PMOS
.model p1 pmos
+ level=1
+ vto=-0.9
+ kp=52u
+ tox=100e-10
+ gamma=0.472
+ phi=0.8
+ lambda=0.09
+ Id=0.05u
+ xj=0.2u
+ uo=150
+ tpg=-1
+ rsh=2.5
+ js=3.76e-8
+ nsub=8e16
+ cj=0.8e-3
+ cjsw=3e-10
+ mj=0.5
+ mjsw=0.25
+ pb=0.96
+ cgso=4e-10
+ cgdo=4e-10
+ cgbo=1.18e-10

M1  ss gg dd dd p1 w=2u l=0.8u
vdd dd 0 3.3
vin gg 0 0
cl  ss 0 10p
il  ss 0 2m

.option post probe
.op
.dc vdd 0 3.3 0.01
.probe v(ss)
.probe i1(m1)
.end