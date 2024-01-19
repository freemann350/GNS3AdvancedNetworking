## R-SEDE-A

```c
conf t
!
router bgp 65010
 bgp router-id 6.1.1.1
 bgp log-neighbor-changes
 !
 neighbor 131.0.100.1 remote-as 2001 !To R-2001-D
 neighbor 2221:2566:2:12::1 remote-as 2001 !To R-2001-D
 !
 address-family ipv4
  redistribute static
  neighbor 131.0.100.1 activate
  exit-address-family
 !
 address-family ipv6
  redistribute static
  neighbor 2221:2566:2:12::1 activate
  exit-address-family
 !
 exit
!
! STATIC ROUTES ON AS EXIT
!
ip route 192.168.10.0 255.255.255.0 Null0
!
end
!

```

## R-SEDE-B

```c
conf t
!
router bgp 65010
 bgp router-id 6.1.1.2
 bgp log-neighbor-changes
 !
 neighbor 131.0.150.1 remote-as 2001 !To R-2001-C
 neighbor 2221:2566:2:11::1 remote-as 2001 !To R-2001-C
 !
 address-family ipv4
  redistribute static
  neighbor 131.0.150.1 activate
  exit-address-family
 !
 address-family ipv6
  redistribute static
  neighbor 2221:2566:2:11::1 activate
  exit-address-family
 !
 exit
!
! STATIC ROUTES ON AS EXIT
!
ip route 192.168.10.0 255.255.255.0 Null0
!
end
!

```