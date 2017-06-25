testing
testDictionary
	| dict diff removedAssociation addition assocDiff dictDiff removal |
	dict := Dictionary newFrom: {1 -> 2. 'foo' -> 'bar'. #bla -> (StringHolder new contents: 'blubb'; yourself)}.
	removedAssociation := dict associationAt: 'foo'.
	self assertDiffAgainstItselfHasNoChanges: dict.
	diff := self diff: dict againstItselfAfter:
		[dict at: 1 put: 3;
			at: 'fuu' put: (dict at: 'foo');
			removeKey: 'foo'.
		(dict at: #bla) contents: 'blobb'].
	self assert: diff squotHasChanges.
	dictDiff := diff diffForObjectNamed: (objectRegistry nameOf: dict)
		ifAbsent: [self fail: 'no diff for Dictionary'].
	dictDiff itemChanges size == 2. "add 'fuu', remove 'foo'"
	addition := dictDiff itemChanges associations detect: [:each | each class == SquotSlotAddition]
		ifNone: [self fail: 'no association addition'].
	self assert: addition slotToBeAdded name = (objectRegistry nameOf: (dict associationAt: 'fuu')).
	removal := dictDiff itemChanges associations detect: [:each | each class == SquotSlotRemoval]
		ifNone: [self fail: 'no association removal'].
	self assert: removal value name = (objectRegistry nameOf: removedAssociation).
	assocDiff := diff diffForObjectNamed: (objectRegistry nameOf: (dict associationAt: 1))
		ifAbsent: [self fail: 'no diff for changed association'].
	self assert: (assocDiff slotChanges at: 'value') value = 3.