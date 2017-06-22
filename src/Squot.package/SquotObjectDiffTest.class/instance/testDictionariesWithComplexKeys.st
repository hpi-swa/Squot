testing
testDictionariesWithComplexKeys
	| dict diff key1 key2 |
	key1 := SquotObjectForDiffTests new var1: 1; var2: 2.
	key2 := SquotObjectForDiffTests new var1: nil; var2: key1.
	dict := Dictionary newFrom: {key1 -> 'value'. key2 -> key1}.
	self assertDiffAgainstItselfHasNoChanges: dict.
	diff := self diff: dict againstItselfAfter:
		[key2 var1: 3.
		dict at: key1 put: 'new value'].
	self assert: diff squotHasChanges.
	self flag: 'TODO: assert something about the change to key2'.
	self flag: 'TODO: assert something about the change of value in the second association'.