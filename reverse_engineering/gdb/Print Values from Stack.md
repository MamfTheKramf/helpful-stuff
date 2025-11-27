Print value one above `$rbp` (on 64-bit systems):
```
p *(long*)($rbp + 8)
```

Print value one below `$rsp`
```
p *(long*)($rsp - 8)
```

