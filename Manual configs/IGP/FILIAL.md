## R-FILIAL-A

```c
conf t
!
router rip
 version 2
 no auto-summary
 network 192.168.20.0
 network 131.0.200.0
!
ipv6 unicast
ipv6 router rip FILIAL
 redistribute ospf 1 metric 5 include-connected
!
interface l0
 ipv6 rip FILIAL enable
!
interface f0/0
 ipv6 rip FILIAL enable
!
interface f0/1
 ipv6 rip FILIAL enable
!
end
!
```