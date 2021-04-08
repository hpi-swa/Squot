tests
testDictionariesWithComplexKeys
	| dict diff key1 key2 key2Diff changedAssocDiff |
	key1 := SquotObjectForDiffTests new var1: 1; var2: 2.
	key2 := SquotObjectForDiffTests new var1: nil; var2: key1.
	dict := Dictionary newFrom: {key1 -> 'value'. key2 -> key1}.
	self assertDiffAgainstItselfHasNoChanges: dict.
	diff := self diff: dict againstItselfAfter:
		[key2 var1: 3.
		dict at: key1 put: 'new value'.
		dict rehash].
	self assert: diff squotHasChanges.
	key2Diff := diff
		diffForObjectNamed: (objectRegistry nameOf: key2)
		ifAbsent: [self fail: 'no diff for changed key object'].
	self assert: (key2Diff slotChanges associationAt: 'var1') replacementShadow value == 3.
	changedAssocDiff := diff
		diffForObjectNamed: (objectRegistry nameOf: (dict associationAt: key1))
		ifAbsent: [self fail: 'no diff for changed association'].
	self assert: (changedAssocDiff slotChanges associationAt: 'value') replacementShadow value = 'new value'.