testing
testDictionariesWithComplexKeys
	| key1 key2 dict shadow associationShadows indexOfFirstAssociation indexOfSecondAssociation |
	key1 := SquotObjectForDiffTests new var1: 1; var2: 2.
	key2 := SquotObjectForDiffTests new var1: nil; var2: key1.
	dict := Dictionary newFrom: {key1 -> 'value'. key2 -> key1}.
	shadow := capturer capture: dict.
	associationShadows := shadow itemSlots.
	indexOfFirstAssociation := associationShadows
		findFirst: [:whose | (whose slots at: 'value') undecorated = 'value' captureWithSquot].
	indexOfSecondAssociation := 3 - indexOfFirstAssociation.
	self assert: ((associationShadows at: indexOfFirstAssociation) slots at: 'key') undecorated == ((associationShadows at: indexOfSecondAssociation) slots at: 'value') undecorated.
	self assert: (((associationShadows at: indexOfSecondAssociation) slots at: 'key') slots at: 'var2') undecorated == ((associationShadows at: indexOfSecondAssociation) slots at: 'value') undecorated.