Use the `p` (`print` or `inspect`) command:

This prints the value of a register:
```
p $rax
```

# Dereferencing
```
p *($rdx + 0x12)
```

# Formatting
Values can be prefixed with `/FMT` to format them in a specific way.
E.g.
```
p /x$rcx
```
prints the value of `$rcx` in hex notation

# Casting
Values can be casted like in C:
```
p /x*((long*)$r12)
```