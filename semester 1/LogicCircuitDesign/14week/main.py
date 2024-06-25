str1 = "Cool"
str2 = "RISC-V"
str3 = "boo!"

str1_encoded = str1.encode('ascii').hex().upper()
str2_encoded = str2.encode('ascii').hex().upper()
str3_encoded = str3.encode('ascii').hex().upper()

str1_address = 0x004F05BC
str2_address = str1_address + len(str1_encoded) // 2
str3_address = str2_address + len(str2_encoded) // 2

# print(f"Memory Address: {str1_address}")
for i in range(len(str1_encoded) // 2):
  byte_address = str1_address + i
  print(f"{hex(byte_address).upper()} : {str1_encoded[i*2:i*2+2]}")

# print(f"Memory Address: {str2_address}")
for i in range(len(str2_encoded) // 2):
  byte_address = str2_address + i
  print(f"{hex(byte_address).upper()} : {str2_encoded[i*2:i*2+2]}")

# print(f"Memory Address: {str3_address}")
for i in range(len(str3_encoded) // 2):
  byte_address = str3_address + i
  print(f"{hex(byte_address).upper()} : {str3_encoded[i*2:i*2+2]}")