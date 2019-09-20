testing
testArrayOfDifferentlyTypedObjects
	| diff |
	diff := self diff: #(1) against: #(nil).
	self assert: diff squotHasChanges.
	self assert: (diff slotChanges associationAt: 1) class == SquotSlotReassignment.
	diff := self diff: #(nil) against: #(1).
	self assert: diff squotHasChanges.
	self assert: (diff slotChanges associationAt: 1) class == SquotSlotReassignment.
	diff := self diff: #('foo') against: #((1)).
	self assert: diff squotHasChanges.
	self assert: (diff slotChanges associationAt: 1) class == SquotSlotReassignment.
	diff := self diff: #((1)) against: #('foo').
	self assert: diff squotHasChanges.
	self assert: (diff slotChanges associationAt: 1) class == SquotSlotReassignment.