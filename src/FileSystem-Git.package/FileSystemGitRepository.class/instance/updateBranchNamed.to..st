git porcelain
updateBranchNamed: aString to: aCommit
	(repository headsDir / aString) exists
		ifFalse: [self error: 'Branch ', aString, ' does exists. Proceed to create.'.
			^ self createBranchNamed: aString at: aCommit].
	repository updateRef: repository headsDir / aString to: aCommit hexHash.