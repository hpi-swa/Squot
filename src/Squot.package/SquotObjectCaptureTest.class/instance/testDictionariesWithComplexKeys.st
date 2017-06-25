testing
testDictionariesWithComplexKeys
	| key1 key2 dict shadow associationShadows firstAssociationSlot secondAssociationSlot |
	key1 := SquotObjectForDiffTests new var1: 1; var2: 2.
	key2 := SquotObjectForDiffTests new var1: nil; var2: key1.
	dict := Dictionary newFrom: {key1 -> 'value'. key2 -> key1}.
	shadow := capturer capture: dict.
	associationShadows := shadow itemSlots.
	firstAssociationSlot := associationShadows
		detect: [:whose | (whose value slots at: 'value') undecorated = 'value' captureWithSquot].
	secondAssociationSlot := associationShadows at: 3 - (associationShadows indexOf: firstAssociationSlot).
	self assert: (firstAssociationSlot value slots at: 'key') undecorated == (secondAssociationSlot value slots at: 'value') undecorated.
	self assert: ((secondAssociationSlot value slots at: 'key') slots at: 'var2') undecorated == (secondAssociationSlot value slots at: 'value') undecorated.