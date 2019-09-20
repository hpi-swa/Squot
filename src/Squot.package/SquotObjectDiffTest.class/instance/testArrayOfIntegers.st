testing
testArrayOfIntegers
	| left right array other arrayName diff |
	"{1. 2} <=> {1. 2}"
	left := capturer captureStandalone: (array := {1. 2}).
	arrayName := objectRegistry nameOf: array.
	other := Array with: 1 with: 2.
	capturer objectGraph assign: arrayName to: other.
	right := capturer captureStandalone: other.
	diff := left squotDiffAgainst: right.
	self deny: diff squotHasChanges.
	"{2. 1} <=> {1. 2}"
	other := Array with: 2 with: 1.
	capturer objectGraph assign: arrayName to: other.
	left := capturer captureStandalone: other.
	diff := left squotDiffAgainst: right.
	self assert: diff squotHasChanges.
	self assert: (diff slotChanges associationAt: 1) class == SquotSlotReassignment.
	self assert: (diff slotChanges associationAt: 2) class == SquotSlotReassignment.
	"{1} <=> {1. 2}"
	other := Array with: 1.
	capturer objectGraph assign: arrayName to: other.
	left := capturer captureStandalone: other.
	diff := left squotDiffAgainst: right.
	self assert: diff squotHasChanges.
	self deny: (diff slotChanges includesKey: 1).
	self assert: (diff slotChanges associationAt: 2) class == SquotSlotAddition.
	"{1. 2} <=> {1}"
	diff := right squotDiffAgainst: left.
	self assert: diff squotHasChanges.
	self deny: (diff slotChanges includesKey: 1).
	self assert: (diff slotChanges associationAt: 2) class == SquotSlotRemoval.