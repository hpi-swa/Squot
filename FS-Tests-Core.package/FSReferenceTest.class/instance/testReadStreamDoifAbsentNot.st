tests
testReadStreamDoifAbsentNot
	| ref pass |
	pass := false.
	ref := filesystem referenceTo: 'plonk'.
	ref 
		readStreamDo: [:stream]
		ifAbsent: [pass := true].
	self assert: pass