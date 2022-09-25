tests
testDictionariesWithSharedAssociations
	| bothDicts dict1 dict2 merge changedAssocMerge dict2Merge |
	dict1 := Dictionary newFrom: {#a -> 1. #b -> 2}.
	dict2 := Dictionary new add: (dict1 associationAt: #a); yourself.
	bothDicts := {dict1. dict2}.
	self deny: (self merge: bothDicts into: bothDicts) hasChanges.
	merge := self mergeOf: bothDicts withChanges:
		[dict2 add: (dict1 associationAt: #b).
		dict1 at: #a put: 42].
	self assert: merge hasChanges.
	dict2Merge := merge mergeAt: (objectRegistry nameOf: dict2).
	self assert: (dict2Merge additions anySatisfy: [:each | (merge incoming nameOf: each rightTarget undecorated) = (objectRegistry nameOf: (dict1 associationAt: #b))]).
	changedAssocMerge := merge mergeAt: (objectRegistry nameOf: (dict1 associationAt: #a)).
	self assert: (changedAssocMerge modifications anySatisfy: [:each | each reference name = 'value' and: [each rightTarget value = 42]]).