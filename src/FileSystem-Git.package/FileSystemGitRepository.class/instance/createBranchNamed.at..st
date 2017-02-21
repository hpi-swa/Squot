git porcelain
createBranchNamed: aString at: aCommit
	(repository headsDir / aString) exists
		ifTrue: [Warning signal: 'Branch ', aString, ' already exists. Proceed to overwrite.'].
	repository updateRef: repository headsDir / aString to: aCommit hexHash.