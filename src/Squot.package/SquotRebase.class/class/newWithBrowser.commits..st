instance creation
newWithBrowser: aBrowser commits: aCollection
	^ self
		newWithBrowser: aBrowser
		operations: (aCollection collect: [:each | SquotRebaseOperationPick newWithCommit: each])