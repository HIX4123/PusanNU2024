# test

Convert the following high-level code snippets into RISC-V assembly language. Assume that the (signed) integer variables g and h are in registers a0 and a1, respectively. Clearly comment your code.

## 1

```
if (g >= h)
  g = g + h;
else
  g = g - h;
```

### Answer

```assembly
  bge a0, a1, L1
  add a0, a0, a1
  j L2
L1:
  sub a0, a0, a1
L2:
```
## 2

```
if (g < h)
  h = h + 1;
else
  h = h * 2;
```

### Answer

```assembly
  blt a0, a1, L3
  addi a1, a1, 1
  j L4
L3:
  slli a1, a1, 1
L4:
```
