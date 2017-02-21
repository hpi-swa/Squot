internal
basicCommit: aMessage to: branchName
	| commit |
	"Disallow empty commits"
	modManager hasModifications ifFalse: [ ^ self ].
	(commit := self prepareNewCommit)
		message: aMessage;
		store.
	repository 
		updateRef: repository headsDir / branchName 
		to: commit hexHash.
	self revision: commit.
	modManager initializeWith: repository with: cache for: revision.