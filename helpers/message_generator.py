x = 100
y = 300

r = 7
g = 0
b = 0

message = ((x << 23 )& 0xFF800000) | ((y << 14) & 0x007FC000) | ((r << 11) & 0x00003800) | ((g << 8) & 0x00000700) | ((b << 5) & 0x000000E0)

sum = message ^ (message >> 1)
sum = sum ^ (sum >> 2)
sum = sum ^ (sum >> 4)
sum = sum ^ (sum >> 8)
sum = sum ^ (sum >> 16)

message = message ^ (sum & 1)

print(hex(message))
