id = 2
points = 3
home = 1
enable = 1


message = ((id << 28 )& 0xF0000000) | ((points << 20) & 0x0FF00000) | ((home << 19) & 0x000080000) | ((enable << 18) & 0x00040000)

sum = message ^ (message >> 1)
sum = sum ^ (sum >> 2)
sum = sum ^ (sum >> 4)
sum = sum ^ (sum >> 8)
sum = sum ^ (sum >> 16)

message = message ^ (sum & 1)

print(hex(message))
