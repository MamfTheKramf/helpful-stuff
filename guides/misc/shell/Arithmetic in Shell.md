in Bash you can do arithmetic expressions in the following way:

```shell
# in decimal format
printf "%d\n" $((15 + 6))

# in hex format
printf "0x%X\n" $((0xa4f - 0xff3c))
```
