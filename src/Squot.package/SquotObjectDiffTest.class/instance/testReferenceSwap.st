testing
testReferenceSwap
	"When two objects exchange places from one capture to another, this should be noticed."
	| a b array diff arrayDiff |
	a := Object new. b := Object new.
	array := {a. b}.
	diff := self diff: array againstItselfAfter: [array swap: 1 with: 2].
	self assert: diff squotHasChanges.
	arrayDiff := diff diffForObjectNamed: (objectRegistry nameOf: array).
	self assert: (arrayDiff slotChanges associationAt: 1) class == SquotSlotReassignment.
	self assert: (arrayDiff slotChanges associationAt: 2) class == SquotSlotReassignment.