verifying
verifyMode: aByteArray
	| byte3 modes mode permissions topBit byte4 permissionBits |
	self assert: 0 equals: (aByteArray first: 2) asInteger.
	
	byte3 := aByteArray third.
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
	byte4 := aByteArray fourth.
	"create UNIX 9-bit permissions"
	permissionBits := topBit bitOr: byte4.
	self assert: (permissions includes: permissionBits)