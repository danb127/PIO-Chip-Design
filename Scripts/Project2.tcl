restart

run 100ns

# Start with everything off

add_force A0 {0 0ns}

add_force CE {1 0ns}

add_force RD {1 0ns}

add_force D {ZZZZZZZZ 0ns}

add_force WR {1 0ns}

add_force RESET {1 0ns}

add_force ACK {1 0ns}

run 50ns

#

add_force RESET {0 0ns}

run 50ns
# Load Control_Reg(1 downto 0) = 0, CE* = 0, A0 = 1,  WR* = 0

# Mode 0 output

add_force CE {0 0ns}

add_force D {00000000 0ns}

add_force A0 {1 0ns}

add_force WR {0 0ns}

run 50ns


add_force WR {1 0ns}

run 50ns

# Write data 0x5A to peripheral

add_force CE {0 0ns}

add_force A0 {0 0ns}

add_force WR {0 0ns}

add_force D {01011010 0ns}

run 50ns

add_force WR {1 0ns}

run 50ns

# Write data 0xA5 to peripheral

add_force CE {0 0ns}

add_force A0 {0 0ns}

add_force WR {0 0ns}

add_force D {10100101 0ns}

run 50ns

# Load Control_Reg(1 downto 0) = 1, CE* = 0, A0 = 1,  WR* = 1, RD = 0

add_force WR {1 0ns}

run 50ns
# Mode 1 Output, INTE = 1 Read Status D2-D0 = 011

add_force CE {0 0ns}

add_force A0 {1 0ns}

add_force RD {0 0ns}

add_force D {00000011 0ns}

run 50ns

add_force RD {1 0ns}

run 50ns

# Write data 0x3C to peripheral

add_force CE {0 0ns}

add_force A0 {0 0ns}

add_force WR {0 0ns}

add_force D {00111100 0ns}

run 50ns


# Read Status again  D2-D0 = 010

add_force WR {1 0ns}

add_force CE {0 0ns}

add_force A0 {1 0ns}

add_force RD {0 0ns}

add_force D {00000010 0ns}

run 50ns

add_force RD {1 0ns}

# Generate ACK

add_force ACK {0 0ns}

run 50ns

# Read Status again D2-D0 = 111

add_force WR {1 0ns}

add_force CE {0 0ns}

add_force A0 {1 0ns}

add_force RD {0 0ns}

add_force D {00000111 0ns}

add_force ACK {1 0ns}

run 50ns

add_force RD {1 0ns}

run 50ns

# Write data 0xC3 to peripheral

add_force CE {0 0ns}

add_force A0 {0 0ns}

add_force WR {0 0ns}

add_force D {11000011 0ns}

run 50ns

add_force WR {1 0ns}

run 50ns 
 # Apply RESET
 
 add_force RESET {1 0ns}
 
 run 50ns
 
 add_force RESET {0 0ns}
 
 # Load Control_Reg(1 downto 0) = 1, CE* = 0, A0 = 1,  WR* = 1, RD = 0


# Mode 1 Output, INTE = 0, Read Status D2-D0 = 011

add_force CE {0 0ns}

add_force A0 {1 0ns}

add_force WR {1 0ns}

add_force RD {0 0ns}

add_force D {00000001 0ns}

run 50ns

add_force RD {1 0ns}

run 50ns

# Write data 0x3C to peripheral

add_force CE {0 0ns}

add_force A0 {0 0ns}

add_force WR {0 0ns}

add_force D {00111100 0ns}

run 50ns

add_force WR {1 0ns}

run 50ns

# Read Status again  D2-D0 = 010

add_force WR {1 0ns}

add_force CE {0 0ns}

add_force A0 {1 0ns}

add_force RD {0 0ns}

add_force D {00000000 0ns}

run 50ns

add_force RD {1 0ns}


# Generate ACK

add_force ACK {0 0ns}

run 50ns

# Read Status again D2-D0 = 111

add_force WR {1 0ns}

add_force CE {0 0ns}

add_force A0 {1 0ns}

add_force RD {0 0ns}

add_force D {00000101 0ns}

run 50ns

add_force ACK {1 0ns} 

# Write data 0xC3 to peripheral

add_force CE {0 0ns}

add_force A0 {0 0ns}

add_force WR {0 0ns}

add_force D {11000011 0ns}

run 50ns

add_force WR {1 0ns}

run 50ns
 
 # Apply RESET
 
 add_force RESET {1 0ns}
 
 run 50ns