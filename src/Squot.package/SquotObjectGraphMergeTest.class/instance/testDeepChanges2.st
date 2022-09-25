tests
testDeepChanges2
	| a b merge mergeOfA |
	a := ValueHolder new contents: (b := ValueHolder new contents: 1; yourself); yourself.
	merge := self mergeOf: a withChanges: [b contents: 2].
	self assert: merge hasChanges.
	mergeOfA := merge mergeAt: (objectRegistry nameOf: a).
	self assert: mergeOfA hasChanges.