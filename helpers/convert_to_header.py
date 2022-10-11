id = 0xF
points = 0
home = 0
enable = 0
configuration = 0
draw_boundary = 0
one_shot = 0
speed_profile = 1


message = ((id << 28 )& 0xF0000000) | \
        ((points << 20) & 0x0FF00000) | \
        ((home << 19) & 0x000080000) | \
        ((enable << 18) & 0x00040000) | \
        ((configuration << 17) & 0x00020000) | \
        ((draw_boundary << 16) & 0x00010000) | \
        ((one_shot << 15) & 0x00008000) | \
        ((speed_profile << 12 & 0x00007000))

sum = message ^ (message >> 1)
sum = sum ^ (sum >> 2)
sum = sum ^ (sum >> 4)
sum = sum ^ (sum >> 8)
sum = sum ^ (sum >> 16)

message = message ^ (sum & 1)

print(hex(message))