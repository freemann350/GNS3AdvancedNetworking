## R-SEDE-A

```c
conf t
!
router bgp 65010
 !
 neighbor 192.168.254.2 remote-as 65010
 neighbor 192.168.254.2 update-source Loopback0
 !
 address-family ipv4
  default-information originate
  neighbor 192.168.254.2 activate
  neighbor 192.168.254.2 next-hop-self
  exit-address-family
 !
end

```

## R-SEDE-B

```c
conf t
!
router bgp 65010
 !
 neighbor 192.168.254.1 remote-as 65010
 neighbor 192.168.254.1 update-source Loopback0
 !
 address-family ipv4
  neighbor 192.168.254.1 activate
  neighbor 192.168.254.1 next-hop-self
  exit-address-family
 !
end

```
