tests
testDictionariesWithComplexKeys
	| key1 key2 dict |
	key1 := SquotObjectForDiffTests new var1: 1; var2: 2.
	key2 := SquotObjectForDiffTests new var1: nil; var2: key1.
	dict := Dictionary newFrom: {key1 -> 'value'. key2 -> key1}.
	self captureRestoreAndCompare: dict.