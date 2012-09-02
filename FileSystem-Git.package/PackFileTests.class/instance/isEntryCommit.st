helpers-testing
isEntryCommit
	^ self hasCommitSignature & self hasCommitData
	