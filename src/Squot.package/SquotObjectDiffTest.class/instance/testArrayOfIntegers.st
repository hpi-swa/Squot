testing
testArrayOfIntegers
	| left right arrayName diff |
	"{1. 2} <=> {1. 2}"
	left := capturer captureGraph: {1. 2}.
	arrayName := left startName.
	{1. 2} in: [:other |
		capturer objectGraph assign: arrayName to: other.
		right := capturer captureGraph: other].
	diff := left squotDiffAgainst: right.
	self deny: diff squotHasChanges.
	"{2. 1} <=> {1. 2}"
	{2. 1} in: [:other |
		capturer objectGraph assign: arrayName to: other.
		left := capturer captureGraph: other].
	diff := left squotDiffAgainst: right.
	self assert: diff squotHasChanges.
	self assert: ((diff diffForObjectNamed: diff startObjectName) slotChanges associationAt: 1) class == SquotSlotReassignment.
	self assert: ((diff diffForObjectNamed: diff startObjectName) slotChanges associationAt: 2) class == SquotSlotReassignment.
	"{1} <=> {1. 2}"
	{1} in: [:other |
		capturer objectGraph assign: arrayName to: other.
		left := capturer captureGraph: other].
	diff := left squotDiffAgainst: right.
	self assert: diff squotHasChanges.
	self deny: ((diff diffForObjectNamed: diff startObjectName) slotChanges includesKey: 1).
	self assert: ((diff diffForObjectNamed: diff startObjectName) slotChanges associationAt: 2) class == SquotSlotAddition.
	"{1. 2} <=> {1}"
	diff := right squotDiffAgainst: left.
	self assert: diff squotHasChanges.
	self deny: ((diff diffForObjectNamed: diff startObjectName) slotChanges includesKey: 1).
	self assert: ((diff diffForObjectNamed: diff startObjectName) slotChanges associationAt: 2) class == SquotSlotRemoval.