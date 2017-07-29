testing
testDictionariesWithSharedAssociations
	| bothDicts dict1 dict2 diff changedAssocDiff dict2Diff |
	dict1 := Dictionary newFrom: {#a -> 1. #b -> 2}.
	dict2 := Dictionary new add: (dict1 associationAt: #a); yourself.
	bothDicts := {dict1. dict2}.
	self assertDiffAgainstItselfHasNoChanges: bothDicts.
	diff := self diff: bothDicts againstItselfAfter:
		[dict2 add: (dict1 associationAt: #b).
		dict1 at: #a put: 42].
	self assert: diff squotHasChanges.
	dict2Diff := diff
		diffForObjectNamed: (objectRegistry nameOf: dict2)
		ifAbsent: [self fail: 'no diff for dict2'].
	self assert: (dict2Diff itemChanges associations detect: [:each | each class == SquotSlotAddition] ifNone: [self fail: 'no slot addition']) slotToBeAdded association name =
		(objectRegistry nameOf: (dict1 associationAt: #b)).
	changedAssocDiff := diff
		diffForObjectNamed: (objectRegistry nameOf: (dict1 associationAt: #a))
		ifAbsent: [self fail: 'no diff for changed association'].
	self assert: (changedAssocDiff slotChanges associationAt: 'value') replacementShadow value = 42.