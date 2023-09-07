changes-creation
changeSetFromFSCommit: anFSCommit toImage: aWorkingCopy
	^ self
		changeSetFromSnapshot: (self loadSnapshotFrom: anFSCommit filesystem)
		toSnapshot: self workingCopySnapshot