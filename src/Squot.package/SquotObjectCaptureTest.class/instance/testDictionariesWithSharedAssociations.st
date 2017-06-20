testing
testDictionariesWithSharedAssociations
	| dict1 dict2 shadow |
	dict1 := Dictionary newFrom: {#a -> 1. #b -> 2}.
	dict2 := Dictionary new add: (dict1 associationAt: #a); yourself.
	shadow := capturer capture: {dict1. dict2}.
	self assert: (((shadow slots at: 2) slots at: #associations) at: 1) undecorated == (((shadow slots at: 1) slots at: #associations) at: 1) undecorated.