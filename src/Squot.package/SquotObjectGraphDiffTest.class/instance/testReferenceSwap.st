tests
testReferenceSwap
	"When two objects exchange places from one capture to another, the containing object
	should have changes, but not the swapped objects."
	| a b array diff |
	a := Object new. b := Object new.
	array := {a. b}.
	diff := self diff: array againstItselfAfter: [array swap: 1 with: 2].
	self assert: diff squotHasChanges;
		assert: (diff diffForObjectNamed: (objectRegistry nameOf: array) ifAbsent: []) notNil;
		assert: (diff diffForObjectNamed: (objectRegistry nameOf: a) ifAbsent: []) isNil;
		assert: (diff diffForObjectNamed: (objectRegistry nameOf: b) ifAbsent: []) isNil.