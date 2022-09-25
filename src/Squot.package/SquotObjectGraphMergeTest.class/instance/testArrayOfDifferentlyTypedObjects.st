tests
testArrayOfDifferentlyTypedObjects
	| merge |
	merge := self merge: {nil} into: {1}.
	self assert: merge hasChanges;
		assert: merge mergeOfStartObject hasChanges.
	merge := self merge: {1} into: {nil}.
	self assert: merge hasChanges;
		assert: merge mergeOfStartObject hasChanges.
	merge := self merge: {'foo'} into: {{1}}.
	self assert: merge hasChanges;
		assert: merge mergeOfStartObject hasChanges.
	merge := self merge: {{1}} into: {'foo'}.
	self assert: merge hasChanges;
		assert: merge mergeOfStartObject hasChanges.