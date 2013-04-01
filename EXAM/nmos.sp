NMOS Simulation

* LEVEL 1 Enhancement NMOS
.model n1 nmos
+ level=1 
+ vto=0.7
+ kp=155u
+ tox=100e-10
+ gamma=0.624
+ phi=0.83
+ lambda=0.03
+ ld=0.03u
+ xj=0.2u
+ uo=450
+ tpg=1
+ rsh=2
+ js=3.22e-8
+ nsub=1.4e17
+ cj=1.1e-3
+ cjsw=3e-10
+ mj=0.5
+ mjsw=0.25
+ pb=0.976
+ cgso=2e-10
+ cgdo=2e-10
+ cgbo=1.18e-10

m1 d g s 0 n1 w=1.9u l=0.8u

vdd d 0 3.3
vin g 0 5
cl  s 0 10p
il  0 s 2m

.option post probe
.op
.dc vdd 0 3.3 0.01
.probe v(s)
.probe i1(m1)
.end