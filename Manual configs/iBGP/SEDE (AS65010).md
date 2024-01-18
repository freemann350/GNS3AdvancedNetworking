## R-SEDE-A

```c
conf t
!
router bgp 65010
 !
 neighbor 192.168.254.2 remote-as 65010
 neighbor 192.168.254.2 update-source Loopback0
 neighbor 2221:2566:6:1111::B remote-as 65010
 neighbor 2221:2566:6:1111::B update-source Loopback0
 !
 address-family ipv4
  neighbor 192.168.254.2 activate
  exit-address-family
 !
 address-family ipv6
  neighbor 2221:2566:6:1111::B activate
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
 neighbor 2221:2566:6:1111::A remote-as 65010
 neighbor 2221:2566:6:1111::A update-source Loopback0
 !
 address-family ipv4
  neighbor 192.168.254.1 activate
  exit-address-family
 !
 address-family ipv6
  neighbor 2221:2566:6:1111::A activate
  exit-address-family
 !
end

```
