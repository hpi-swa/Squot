instance creation
newWithBrowser: aBrowser commits: aCollection
	^ self
		newWithBrowser: aBrowser
		operations: (aCollection collect: [:each | GSRebaseOperationPick newWithCommit: each])