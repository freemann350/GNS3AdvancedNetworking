
- PREFERENCIAL PARA 1000 DE AS 2001 **f1/1** (LINK PRIORITY)
- PREFERENCIAL PARA 1000 DE AS 2002 **R-2002-A (f0/0)** (MED)
- Preferencial de 3001 para 2001 **f0/1**
- (3001, 3002) Rerouting para AS 2002 se 2001 falhar (MED)
---
**AS 1000**
Definir LP em R-1001-F (150) (preferencia o R-1001-F)
Definir LP em R-1001-G (140)
Definir LP em R-1001-H (130)
Definir LP em R-1001-I (120)

Definir MED em R-1001-G (preferencia o R-1001-F)
Definir MED em R-1001-G (preferencia o R-1001-F)

**AS 2001**
Definir LP em R-2001-B (150) (preferencia o R-2001-B)
Definir MED em R-2001-C (preferencia o R-2001-B)

**AS 2002**
Definir MED em R-2002-C (preferencia o AS 2001)

```c
F
--
...
neighbor 2001:2:BEEF:1001::2 route-map MED_100 out
...
ip as-path access-list 1 permit _1000$

route-map MED_100 permit 10
 match as-path 1
 set metric 100

--
H
--
...
neighbor 2001:2:BEEF:1003::2 route-map MED_100 out
...
ip as-path access-list 1 permit _1000$

route-map MED_100 permit 10
 match as-path 1
 set metric 100

--
K
--
...
neighbor 2001:2:BEEF:1003::1 route-map LOCPREF_120 in
neighbor 2001:2:BEEF:1004::1 route-map LOCPREF_120 in
...
ip as-path access-list 1 permit _1000$

route-map LOCPREF_120 permit 10
 match as-path 1
 set local-preference 120
```

