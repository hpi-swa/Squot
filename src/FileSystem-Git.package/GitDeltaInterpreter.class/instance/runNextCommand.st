executing
runNextCommand
	| cmd |
	cmd := commands next.
	cmd = 0 ifTrue: [ GitInvalidBytesError signal: 'opcode 0 is a reserved byte. This delta is invalid.' ].
	cmd < 128
		ifTrue: [output nextPutAll: (commands next: cmd)]
		ifFalse: [ | offset size |
			offset := 0.
			(cmd bitAnd: 2r00000001) isZero ifFalse: [ offset := commands next].
			(cmd bitAnd: 2r00000010) isZero ifFalse: [ offset := offset bitOr: commands next << 8 ].
			(cmd bitAnd: 2r00000100) isZero ifFalse: [ offset := offset bitOr: commands next << 16 ].
			(cmd bitAnd: 2r00001000) isZero ifFalse: [ offset := offset bitOr: commands next << 24 ].

			size := 0.
			(cmd bitAnd: 2r00010000) isZero ifFalse: [size := commands next].
			(cmd bitAnd: 2r00100000) isZero ifFalse: [size := size bitOr: commands next << 8 ].
			(cmd bitAnd: 2r01000000) isZero ifFalse: [size := size bitOr: commands next << 16 ].
			size = 0 ifTrue: [ size := 16r10000 ].
			
			output nextPutAll: (source copyFrom: offset + 1 to: offset + size) ]