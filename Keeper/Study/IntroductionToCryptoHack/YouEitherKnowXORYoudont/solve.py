from pwn import xor

code = "0e0b213f26041e480b26217f27342e175d0e070a3c5b103e2526217f27342e175d0e077e263451150104"
code = bytes.fromhex(code)

print(xor(code, "myXORkey".encode()).decode())
