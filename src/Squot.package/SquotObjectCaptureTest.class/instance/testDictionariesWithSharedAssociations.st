testing
testDictionariesWithSharedAssociations
	| dict1 dict2 shadow dict1Shadow dict2Shadow sharedSlot |
	dict1 := Dictionary newFrom: {#a -> 1. #b -> 2}.
	dict2 := Dictionary new add: (dict1 associationAt: #a); yourself.
	self assert: (dict1 associationAt: #a) == (dict2 associationAt: #a).
	shadow := capturer captureStandalone: {dict1. dict2}.
	dict1Shadow := shadow slots at: 1.
	dict2Shadow := shadow slots at: 2.
	sharedSlot := dict2Shadow itemSlots at: 1.
	self assert: sharedSlot value undecorated == (sharedSlot lookupIn: dict1Shadow) value undecorated.