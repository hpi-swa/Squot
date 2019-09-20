testing
testDictionary
	| dict diff removedAssociation addition removal |
	dict := Dictionary newFrom: {1 -> 2. 'foo' -> 'bar'. #bla -> (StringHolder new contents: 'blubb'; yourself)}.
	removedAssociation := dict associationAt: 'foo'.
	self assertDiffAgainstItselfHasNoChanges: dict.
	diff := self diff: dict againstItselfAfter:
		[dict at: 1 put: 3; "this changes the association, not the dictionary"
			at: 'fuu' put: (dict at: 'foo');
			removeKey: 'foo'.
		(dict at: #bla) contents: 'blobb'].
	self assert: diff squotHasChanges.
	diff itemChanges size == 2. "add 'fuu', remove 'foo'"
	addition := diff itemChanges associations detect: [:each | each class == SquotSlotAddition]
		ifNone: [self fail: 'no association addition'].
	self assert: addition slotToBeAdded association name = (objectRegistry nameOf: (dict associationAt: 'fuu')).
	removal := diff itemChanges associations detect: [:each | each class == SquotSlotRemoval]
		ifNone: [self fail: 'no association removal'].
	self assert: removal slotToBeRemoved value name = (objectRegistry nameOf: removedAssociation).