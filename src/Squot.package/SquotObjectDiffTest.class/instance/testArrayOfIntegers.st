testing
testArrayOfIntegers
	| diff |
	diff := self diff: {1. 2} against: {1. 2}.
	self deny: diff squotHasChanges.
	diff := self diff: {2. 1} against: {1. 2}.
	self assert: diff squotHasChanges.
	self assert: ((diff diffForObjectNamed: diff startObjectName) slotChanges associationAt: 1) class == SquotSlotReassignment.
	self assert: ((diff diffForObjectNamed: diff startObjectName) slotChanges associationAt: 2) class == SquotSlotReassignment.
	diff := self diff: {1} against: {1. 2}.
	self assert: diff squotHasChanges.
	self deny: ((diff diffForObjectNamed: diff startObjectName) slotChanges includesKey: 1).
	self assert: ((diff diffForObjectNamed: diff startObjectName) slotChanges associationAt: 2) class == SquotSlotAddition.
	diff := self diff: {1. 2} against: {1}.
	self assert: diff squotHasChanges.
	self deny: ((diff diffForObjectNamed: diff startObjectName) slotChanges includesKey: 1).
	self assert: ((diff diffForObjectNamed: diff startObjectName) slotChanges associationAt: 2) class == SquotSlotRemoval.