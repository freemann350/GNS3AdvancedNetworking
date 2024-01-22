## R-SEDE-A

```c
conf t
!
ipv6 unicast-routing
!
router ospfv3 1
!
address-family ipv4 unicast
 router-id 6.6.4.1
 exit-address-family
!
end
!

```

```c
conf t
!
interface f0/0
 ospfv3 1 ipv4 area 0
!
interface f0/1
 ospfv3 1 ipv4 area 0
!
interface l0
 ospfv3 1 ipv4 area 0
!
end
!

```

## R-SEDE-B

```c
conf t
!
ipv6 unicast-routing
!
router ospfv3 1
!
address-family ipv4 unicast
 router-id 6.6.4.2
 exit-address-family
!
end
!
```

```c
conf t
!
interface f0/0
 ospfv3 1 ipv4 area 0
!
interface l0
 ospfv3 1 ipv4 area 0
!
end
!
```