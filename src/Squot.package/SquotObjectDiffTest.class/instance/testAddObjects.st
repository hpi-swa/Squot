testing
testAddObjects
	| diff object |
	object := ValueHolder new contents: nil.
	diff := self diff: object againstItselfAfter: [object contents: (ValueHolder new contents: 1)].
	self assert: diff squotHasChanges.
	self assert: (diff slotChanges associationAt: 'contents') class == SquotSlotReassignment.