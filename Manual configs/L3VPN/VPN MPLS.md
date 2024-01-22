# R-2001-A

```c
conf t 
!
ip vrf Empresa
 rd 100:1
 route-target export 100:1
 route-target import 100:1
!
mpls label range 1000 1999
! 
interface f0/0
 mpls ip
!
interface f1/0
 ip vrf forwarding Empresa
!
router bgp 2001
 address-family vpnv4
  neighbor 131.0.255.3 activate
!
 address-family ipv4 vrf Empresa
  redistribute connected
  redistribute rip
!
router rip
 address-family ipv4 vrf Empresa
  version 2
  network 131.0.0.0
  redistribute bgp 2001 metric transparent
  no auto-summary
!
end

```

# R-2001-C

```c
conf t
!
ip vrf Empresa
 rd 100:1
 route-target export 100:1
 route-target import 100:1
!
mpls label range 3000 3999
!
interface f0/1
 mpls ip
!
interface f1/1
 ip vrf forwarding Empresa
!
router bgp 2001
!
 address-family vpnv4
 neighbor 131.0.255.1 activate
!
 address-family ipv4 vrf Empresa
  neighbor 131.0.150.2 remote-as 65010
  redistribute connected
!
end

```

# R-2001-D

```c
conf t
!
mpls label range 2000 2999
!
interface f0/0
 mpls ip
!
interface f0/1
 mpls ip
!
end

```

REDISTRIBUTE BGP 65010 SEDE B OSPFV3