private
newWorkingDirectory
	^ self headHash
		ifNil: [repository orphanedWorkingDirectory]
		ifNotNil: [:hash | repository workingTreeForCommitNamed: hash]
	