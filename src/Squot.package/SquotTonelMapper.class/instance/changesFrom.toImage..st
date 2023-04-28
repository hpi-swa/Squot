changes-creation
changesFrom: anFSCommit toImage: aWorkingCopy
	^ self
		changesFromSnapshot: (self loadSnapshotFrom: anFSCommit filesystem)
		toSnapshot: self workingCopySnapshot