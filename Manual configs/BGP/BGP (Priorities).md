# AS 1000

## R-1001-F (LP TO 2001)

```c
conf t
!
ip as-path access-list 1 permit _2001$
!
route-map LOCPREF_120_2001 permit 10
 match as-path 1
 set local-preference 150
!
router bgp 1001
 !
 address-family ipv4
  neighbor 130.0.1.2 route-map LOCPREF_120_2001 in
  exit-address-family
 !
 address-family ipv6
  neighbor 2221:2566:1:1020::2 route-map LOCPREF_120_2001 in
  exit-address-family
!
end
!

```

## R-1001-G (MED FROM 2001)

```c
conf t
!
ip as-path access-list 1 permit _2001$
!
route-map MED_100_2001 permit 10
 match as-path 1
 set metric 100
!
router bgp 1001
 !
 address-family ipv4
  neighbor 130.0.1.6 route-map MED_100_2001 out
  exit-address-family
 ! 
 address-family ipv6
  neighbor 2221:2566:1:1120::2 route-map MED_100_2001 out
  exit-address-family
 !
end
!

```

## R-1001-H (MED FROM 2002)

```c
conf t
!
ip as-path access-list 1 permit _2002$
!
route-map MED_100_2001 permit 10
 match as-path 1
 set metric 100
!
router bgp 1001
 !
 address-family ipv4
  neighbor 130.0.3.2 route-map MED_100_2002 out
  exit-address-family
 ! 
 address-family ipv6
  neighbor 2221:2566:1:1130::2 route-map MED_100_2002 out
  exit-address-family
 !
end
!

```

## R-1001-I (LP TO 2002)

```c
conf t
!
ip as-path access-list 1 permit _2002$
!
route-map LOCPREF_120_2002 permit 10
 match as-path 1
 set local-preference 150
!
router bgp 1001
 !
 address-family ipv4
  neighbor 130.0.3.6 route-map LOCPREF_120_2002 in
  exit-address-family
 !
 address-family ipv6
  neighbor 2221:2566:1:1130::2 route-map LOCPREF_120_2002 in
  exit-address-family
!
end
!

```

# AS 2001

## R-2001-B (LP TO 3001)

```c
conf t
!
ip as-path access-list 1 permit _3001$
!
route-map LOCPREF_120_3001 permit 10
 match as-path 1
 set local-preference 150
!
router bgp 2001
 !
 address-family ipv4
  neighbor 133.0.255.1 route-map LOCPREF_120_3001 in
  exit-address-family
 !
 address-family ipv6
  neighbor 2221:2566:4:3001::A route-map LOCPREF_120_3001 in
  exit-address-family
!
end
!

```

## R-2001-C (MED FROM 3001)
 
```c
conf t
!
ip as-path access-list 1 permit _2001$
!
route-map MED_100_2001 permit 10
 match as-path 1
 set metric 100
!
router bgp 2001
 !
 address-family ipv4
  neighbor 133.0.255.1 route-map MED_100_2001 out
  exit-address-family
 ! 
 address-family ipv6
  neighbor 2221:2566:4:3001::A route-map MED_100_2001 out
  exit-address-family
 !
end
!

```
# AS 2002

## R-2002-A (LP TO 1000)

```c
conf t
!
ip as-path access-list 1 permit _1000$
!
route-map LOCPREF_120_1000 permit 10
 match as-path 1
 set local-preference 150
!
router bgp 2002
 !
 address-family ipv4
  neighbor 130.0.3.5 route-map LOCPREF_120_3001 in
  exit-address-family
 !
 address-family ipv6
  neighbor 2221:2566:1:1130::1 route-map LOCPREF_120_3001 in
  exit-address-family
!
end
!

```

# AS 3001

## R-3001-A (MED FROM 2001)
 
```c
conf t
!
ip as-path access-list 1 permit _3001$
!
route-map MED_100_3001 permit 10
 match as-path 1
 set metric 100
!
router bgp 3001
 !
 address-family ipv4
  neighbor 131.0.255.3 route-map MED_100_3001 out
  exit-address-family
 ! 
 address-family ipv6
  neighbor 2221:2566:2:2001::C route-map MED_100_3001 out
  exit-address-family
 !
end
!

```
