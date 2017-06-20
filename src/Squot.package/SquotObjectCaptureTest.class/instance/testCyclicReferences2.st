testing
testCyclicReferences2
	| a b shadowOfA shadowOfB |
	a := SquotObjectForDiffTests new var1: 1; var2: nil.
	b := SquotObjectForDiffTests new var1: 2; var2: a.
	a var2: b.
	shadowOfA := capturer capture: a.
	shadowOfB := (shadowOfA slots at: 'var2').
	self assert: (shadowOfB slots at: 'var2') undecorated == shadowOfA.
	self assert: (shadowOfB name includes: 'var2').