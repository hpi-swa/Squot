changes-creation
changesFromImage: aWorkingCopy toFSCommit: anFSCommit
	^ self
		changesFromSnapshot: self workingCopySnapshot
		toSnapshot: (self loadSnapshotFrom: anFSCommit filesystem)