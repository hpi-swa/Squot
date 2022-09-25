tests
testDeepChanges
	| a b merge mergeOfA |
	a := Array with: (b := Array with: 1).
	merge := self mergeOf: a withChanges: [b at: 1 put: 2].
	self assert: merge hasChanges.
	mergeOfA := merge mergeAt: (objectRegistry nameOf: a).
	self assert: mergeOfA hasChanges.