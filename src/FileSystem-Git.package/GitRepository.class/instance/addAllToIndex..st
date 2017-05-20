index manipulation
addAllToIndex: aCollectionOfPaths
	| relativePaths workingCopyDir deleted modified |
	workingCopyDir := self workingCopyDir.
	relativePaths := aCollectionOfPaths collect: [:each | each relativeTo: workingCopyDir] as: OrderedCollection.
	modified := OrderedCollection new.
	deleted := OrderedCollection new.
	relativePaths do: [:each |
		(workingCopyDir resolve: each) exists
			ifTrue: [modified add: each]
			ifFalse: [deleted add: each]].
	self index openForUpdateDo:
		[:index | index
			deleteEntries: deleted;
			updateEntries: modified].