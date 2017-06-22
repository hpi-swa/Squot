testing
testDictionariesWithSharedAssociations
	| bothDicts dict1 dict2 diff |
	dict1 := Dictionary newFrom: {#a -> 1. #b -> 2}.
	dict2 := Dictionary new add: (dict1 associationAt: #a); yourself.
	bothDicts := {dict1. dict2}.
	self assertDiffAgainstItselfHasNoChanges: bothDicts.
	diff := self diff: bothDicts againstItselfAfter:
		[dict2 add: (dict1 associationAt: #b).
		dict1 at: #a put: 42].
	self assert: diff squotHasChanges.
	self flag: 'TODO: assert something about the changed associations'.