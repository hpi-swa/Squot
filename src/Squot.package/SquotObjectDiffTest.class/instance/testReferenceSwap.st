testing
testReferenceSwap
	"When two objects exchange places from one capture to another, this should be noticed."
	| array left right diff |
	a := Object new. b := Object new.
	array := {a. b}.
	left := array captureWithSquot.
	array swap: 1 with: 2.
	right := array captureWithSquot.
	diff := left squotDiffAgainst: right.
	self assert: diff squotHasChanges.
	self assert: (diff slotChanges associationAt: 1) class == SquotSlotReassignment.
	self assert: (diff slotChanges associationAt: 2) class == SquotSlotReassignment.