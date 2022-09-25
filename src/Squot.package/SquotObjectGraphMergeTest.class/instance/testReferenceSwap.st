tests
testReferenceSwap
	"When two objects exchange places from one capture to another, the containing object
	should have changes, but not the swapped objects."
	| a b array merge |
	a := Object new. b := Object new.
	array := {a. b}.
	merge := self mergeOf: array withChanges: [array swap: 1 with: 2].
	self assert: merge hasChanges;
		assert: (merge includesMergeAt: (objectRegistry nameOf: array));
		deny: (merge includesModificationAt: (objectRegistry nameOf: a));
		deny: (merge includesModificationAt: (objectRegistry nameOf: b)).