tests-index
testFanoutOffsets
	"byte N records the number of objects with names <= N.
	Consequence: byte 255 records the *total* number of objects in the pack"
	| offsets |
	offsets := creator fanoutOffsets.
	self assert: 256 equals: offsets size.
	self assert: 1 equals: (offsets at: 0 + 1) asInteger.
	self assert: 1 equals: (offsets at: 1 + 1) asInteger.
	self assert: 4 equals: (offsets at: 20+ 1) asInteger.
	self assert: 5 equals: (offsets at: 235 + 1) asInteger.
	self assert: 6 equals: (offsets at: 236 + 1) asInteger.
	self assert: 7 equals: (offsets at: 255+ 1) asInteger