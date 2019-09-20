testing
testSet
	| set stringHolder diff addition removal |
	set := Set newFrom: {1. 2. stringHolder := StringHolder new contents: 'foo'}.
	self assertDiffAgainstItselfHasNoChanges: set.
	diff := self diff: set againstItselfAfter:
		[set remove: 1;
			add: 3.
		stringHolder contents: 'fooo'].
	self assert: diff squotHasChanges.
	addition := diff itemChanges associations detect: [:each | each class == SquotSlotAddition]
		ifNone: [self fail: 'no item addition'].
	self assert: addition slotToBeAdded value value == 3.
	removal := diff itemChanges associations detect: [:each | each class == SquotSlotRemoval]
		ifNone: [self fail: 'no item removal'].
	self assert: removal slotToBeRemoved value value == 1.