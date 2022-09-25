tests
testDeepChanges3
	"Try to provoke the comparison algorithm to visit an object again only after changes to it have been detected already."
	| a b c d merge mergeOfC |
	a := ValueHolder new
		contents: {(b := ValueHolder new contents: 1).
			(c := ValueHolder new contents: (d := ValueHolder new contents: b))}.
	merge := self mergeOf: a withChanges: [b contents: 2].
	self assert: merge hasChanges.
	mergeOfC := merge mergeAt: (objectRegistry nameOf: c).
	self assert: mergeOfC squotHasChanges.