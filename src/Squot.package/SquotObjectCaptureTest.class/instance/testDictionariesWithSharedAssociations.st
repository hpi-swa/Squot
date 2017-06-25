testing
testDictionariesWithSharedAssociations
	| dict1 dict2 shadow dict1Shadow dict2Shadow |
	dict1 := Dictionary newFrom: {#a -> 1. #b -> 2}.
	dict2 := Dictionary new add: (dict1 associationAt: #a); yourself.
	shadow := capturer capture: {dict1. dict2}.
	dict1Shadow := shadow slots at: 1.
	dict2Shadow := shadow slots at: 2.
	self assert: (dict2Shadow itemSlots at: 1) value undecorated == (dict1Shadow itemSlots at: 1) value undecorated.