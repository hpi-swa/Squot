testing
testDictionariesWithSharedAssociations
	| bothDicts dict1 dict2 restoredDicts |
	dict1 := Dictionary newFrom: {#a -> 1. #b -> 2}.
	dict2 := Dictionary new add: (dict1 associationAt: #a); yourself.
	bothDicts := {dict1. dict2}.
	restoredDicts := self captureAndRestore: bothDicts.
	self assert: (restoredDicts second associationAt: #a) == (restoredDicts first associationAt: #a).