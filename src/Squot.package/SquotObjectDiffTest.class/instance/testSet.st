testing
testSet
	| set stringHolder diff addition removal setDiff stringHolderDiff |
	set := Set newFrom: {1. 2. stringHolder := StringHolder new contents: 'foo'}.
	self assertDiffAgainstItselfHasNoChanges: set.
	diff := self diff: set againstItselfAfter:
		[set remove: 1;
			add: 3.
		stringHolder contents: 'fooo'].
	self assert: diff squotHasChanges.
	setDiff := diff diffForObjectNamed: diff startObjectName.
	self assert: setDiff itemChanges size == 2. "addition, removal"
	addition := setDiff itemChanges associations detect: [:each | each class == SquotSlotAddition]
		ifNone: [self fail: 'no item addition'].
	self assert: addition slotToBeAdded value value == 3.
	removal := setDiff itemChanges associations detect: [:each | each class == SquotSlotRemoval]
		ifNone: [self fail: 'no item removal'].
	self assert: removal value value == 1.
	stringHolderDiff := diff diffForObjectNamed: (objectRegistry nameOf: stringHolder)
		ifAbsent: [self fail: 'no diff for changed item'].