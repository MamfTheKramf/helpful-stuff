If we have a lot of bytes that we want to place in a continuous space of memory, we can do it like so:
```bash
(gdb) set $addr = 0x7fffffffe000
(gdb) set $bytes = "\xab\x0f\x34"
(gdb) set $i = 0
(gdb) while ($i < strlen($bytes))
 >set *(char*)($addr + $i) = $bytes[$i]
 >set $i = $i + 1
 >end
```
