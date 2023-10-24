refs
currentSymbolicHeadTarget
	^ (self headRef ifNil: [^ nil]) isSymbolic
		ifTrue: [self currentHeadTarget]
		ifFalse: [nil]