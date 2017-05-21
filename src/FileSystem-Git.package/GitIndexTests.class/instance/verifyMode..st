verifying
verifyMode: anInteger
	| byte3 modes mode permissions topBit byte4 permissionBits |
	self assert: 0 equals: (anInteger bitShift: -16).
	
	byte3 := anInteger digitAt: 2. "digit 1 = LSB"
	modes := #(
		2r1000 "file"
		2r1010 "symlink"
		2r1110 "gitlink").
	
	mode := byte3 bitShift: -4.
	self assert: (modes includes: mode).
	
	"3 unused bits"
	self assert: 0 equals: (byte3 bitAnd: 2r00001110).
	
	permissions := #(
		8r755 "regular file"
		8r644 "regular file"
		0 "symlink / gitlink").
	"shift to position 9"
	topBit := (byte3 bitAnd: 1) bitShift: 8.
	byte4 := anInteger digitAt: 1.
	"create UNIX 9-bit permissions"
	permissionBits := topBit bitOr: byte4.
	self assert: (permissions includes: permissionBits)