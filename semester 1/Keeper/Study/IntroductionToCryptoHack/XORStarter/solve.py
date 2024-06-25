label = "label"

for char in label:
  print(chr(ord(char) ^ 13), end="")