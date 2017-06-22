testing
testReferenceSwap
	"When two objects exchange places from one capture to another, this should be noticed."
	| array diff |
	a := Object new. b := Object new.
	array := {a. b}.
	diff := self diff: array againstItselfAfter: [array swap: 1 with: 2].
	self assert: diff squotHasChanges.
	self assert: (diff slotChanges associationAt: 1) class == SquotSlotReassignment.
	self assert: (diff slotChanges associationAt: 2) class == SquotSlotReassignment.