tests
testDictionariesWithComplexKeys
	| dict merge key1 key2 key2Merge changedAssocMerge |
	key1 := SquotObjectForDiffTests new var1: 1; var2: 2.
	key2 := SquotObjectForDiffTests new var1: nil; var2: key1.
	dict := Dictionary newFrom: {key1 -> 'value'. key2 -> key1}.
	self deny: (self merge: dict into: dict) hasChanges.
	merge := self mergeOf: dict withChanges:
		[key2 var1: 3.
		dict at: key1 put: 'new value'.
		dict rehash].
	self assert: merge hasChanges.
	key2Merge := merge mergeAt: (objectRegistry nameOf: key2).
	self assert: (key2Merge result instVarSlotNamed: 'var1') value value == 3.
	changedAssocMerge := merge mergeAt: (objectRegistry nameOf: (dict associationAt: key1)).
	self assert: (changedAssocMerge result instVarSlotNamed: 'value') value = 'new value'.