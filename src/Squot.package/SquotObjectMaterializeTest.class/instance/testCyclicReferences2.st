tests
testCyclicReferences2
	| a b restored |
	a := SquotObjectForDiffTests new var1: 1; var2: nil.
	b := SquotObjectForDiffTests new var1: 2; var2: a.
	a var2: b.
	restored := self captureAndRestore: a.
	self assert: restored var2 var2 == restored.
	self assert: (capturer objectGraph nameOf: a)
		equals: (materializer objectGraph nameOf: restored).
	self assert: (capturer objectGraph nameOf: a var2)
		equals: (materializer objectGraph nameOf: restored var2).