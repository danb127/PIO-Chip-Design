restart 

 

# assert reset and initialize variables 

add_force CE {1 0ns} 

add_force A0 {0 0ns} 

add_force RD {1 0ns} 

add_force WR {1 0ns} 

add_force RESET {1 0ns} 

add_force D {ZZZZZZZZ 0ns} 

add_force ACK {1 0ns} 

run 100ns 

 

# remove reset 

add_force RESET {0 0ns} 

run 100ns 

 

# assert RD w/o CE 

add_force RD {0 0ns} 

run 50ns 

 

# assert CE w/o RD 

add_force CE {0 0ns} 

add_force RD {1 0ns} 

run 50ns 

 

# write 00 to CR(mode 0 output) 

add_force A0 {1 0ns} 

add_force WR {0 0ns} 

add_force D {00000000 0ns} 

run 50ns 

 

add_force WR {1 0ns} 

run 50ns 

 

# write 0x5A to peripheral 

add_force A0 {0 0ns} 

add_force WR {0 0ns} 

add_force D {01011010 0ns} 

run 50ns 

 

add_force WR {1 0ns} 

run 50ns 

 

# write 0xA5 to peripheral 

add_force WR {0 0ns} 

add_force D {10100101 0ns} 

run 50ns 

 

add_force WR {1 0ns} 

run 50ns 

 

# write 11 to CR(mode 1 output w/ interrupts) 

add_force A0 {1 0ns} 

add_force WR {0 0ns} 

add_force D {00000011 0ns} 

run 50ns 

 

add_force WR {1 0ns} 

run 50ns 

 

# read SR 

add_force RD {0 0ns} 

remove_force D 

run 50ns 

 

# write 0x3C to peripheral 

add_force A0 {0 0ns} 

add_force RD {1 0ns} 

add_force WR {0 0ns} 

add_force D {00111100 0ns} 

run 50ns 

 

add_force WR {1 0ns} 

run 50ns 

 

# write 11 to CR(mode 1 output w/ interrupts) 

add_force A0 {1 0ns} 

add_force WR {0 0ns} 

add_force D {00000010 0ns} 

run 50ns 

 

add_force WR {1 0ns} 

run 50ns 

 



# read SR 

add_force A0 {1 0ns} 

add_force RD {0 0ns} 

remove_force D 

run 50ns 

 

# generate ACK 

add_force RD {1 0ns} 

add_force ACK {0 0ns} 

run 50ns 

 

add_force ACK {1 0ns} 

run 50ns 

 

# read SR 

add_force RD {0 0ns} 

run 50ns 

 

# write 0xC3 to peripheral 

add_force A0 {0 0ns} 

add_force RD {1 0ns} 

add_force WR {0 0ns} 

add_force D {11000011 0ns} 

run 50ns 

 

add_force WR {1 0ns} 

run 50ns 

 

# assert RESET 

add_force RESET {1 0ns} 

run 50ns 

 

add_force RESET {0 0ns} 

run 50ns 

 

# write 01 to CR(mode 1 output w/o interrupts) 

add_force A0 {1 0ns} 

add_force WR {0 0ns} 

add_force D {00000001 0ns} 

run 50ns 

 

add_force WR {1 0ns} 

run 50ns 

 

# read SR 

add_force RD {0 0ns} 

remove_force D 

run 50ns 

 

# write 0x3C to peripheral 

add_force A0 {0 0ns} 

add_force RD {1 0ns} 

add_force WR {0 0ns} 

add_force D {00111100 0ns} 

run 50ns 

 

add_force WR {1 0ns} 

run 50ns 

 

# read SR 

add_force A0 {1 0ns} 

add_force RD {0 0ns} 

remove_force D 

run 50ns 

 

# generate ACK 

add_force RD {1 0ns} 

add_force ACK {0 0ns} 

run 50ns 

 

add_force ACK {1 0ns} 

run 50ns 

 

# read SR 

add_force RD {0 0ns} 

run 50ns 

 

# write 0xC3 to peripheral 

add_force A0 {0 0ns} 

add_force RD {1 0ns} 

add_force WR {0 0ns} 

add_force D {11000011 0ns} 

run 50ns 

 

add_force WR {1 0ns} 

run 50ns 