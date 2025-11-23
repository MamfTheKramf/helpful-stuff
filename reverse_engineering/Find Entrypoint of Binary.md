Normally, this should be easy by just doing
```shell
objdump -D my_binary
```

But if it is obfuscated, you can do
```shell
objdump -D -f my_binary
```
and should find a line with
```
start address <start-address>
```