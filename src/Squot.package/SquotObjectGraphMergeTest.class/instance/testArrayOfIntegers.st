tests
testArrayOfIntegers
	| array merge |
	array := {1. 2}.
	"{1. 2} <=> {1. 2}"
	merge := self merge: array copy into: array.
	self deny: merge hasChanges.
	"{2. 1} <=> {1. 2}"
	merge := self mergeOf: array withChanges: [array swap: 1 with: 2].
	self assert: merge hasChanges;
		assert: (merge includesModificationAt: (objectRegistry nameOf: array)).
	"{1} <=> {1. 2}"
	array := {1. 2}.
	merge := self merge: {array} into: {{1}}.
	self assert: merge hasChanges;
		assert: (merge includesModificationAt: (objectRegistry nameOf: array)).
	"{1. 2} <=> {1}"
	merge := self merge: {{1}} into: {array}.
	self assert: merge hasChanges.