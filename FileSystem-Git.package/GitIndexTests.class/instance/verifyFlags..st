verifying
verifyFlags: aByteArray
	"see 'index-format.txt' in the docs"
	| byte1 assumedValid extended mergeStage intentToAdd nameLength |
	byte1 := aByteArray first.
	assumedValid := byte1 bitShift: -7.
	self assert: 0 equals: assumedValid.
	extended := (byte1 bitShift: -6) bitAnd: 2r01.
	self assert: 0 equals: extended.
	mergeStage := (byte1 bitShift: -4) bitAnd: 2r0011.
	self assert: 0 equals: mergeStage.
	intentToAdd := (byte1 bitShift: -3) bitAnd: 2r00001.
	self assert: 0 equals: intentToAdd.
	
	"12 bits name length. length if length < 0xFFF, else 0xFFF"
	nameLength := (byte1 bitAnd: 2r00000111) bitShift: 5.
	nameLength := aByteArray second bitOr: nameLength.
	self assert: 7 equals: nameLength