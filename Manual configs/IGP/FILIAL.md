## R-FILIAL-A

```c
conf t
!
router rip
 version 2
 redistribute connected
 no auto-summary
 network 131.0.200.0
!
end
!
```