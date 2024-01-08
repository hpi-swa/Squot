as yet unclassified
newWithCommits: aCollection
	^ self newWithOperations: (aCollection collect: [:each | SquotRebaseOperationPick newWithCommit: each])