tests
testSet
	| set stringHolder restoredSet restoredStringHolder |
	set := Set newFrom: {1. 2. stringHolder := StringHolder new contents: 'foo'}.
	restoredSet := self captureAndRestore: set.
	self assert: (restoredSet includesAllOf: #(1 2)).
	restoredStringHolder := restoredSet detect: [:each | each class == StringHolder]
		ifNone: [self fail: 'StringHolder not rematerialized'].
	self assert: 'foo' equals: restoredStringHolder contents.