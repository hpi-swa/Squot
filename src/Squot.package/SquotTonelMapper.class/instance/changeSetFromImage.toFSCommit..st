changes-creation
changeSetFromImage: aWorkingCopy toFSCommit: anFSCommit
	^ self
		changeSetFromSnapshot: self workingCopySnapshot
		toSnapshot: (self loadSnapshotFrom: anFSCommit filesystem)