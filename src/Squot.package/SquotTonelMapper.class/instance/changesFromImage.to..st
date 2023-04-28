changes-creation
changesFromImage: aWorkingCopy to: anFSCommit
	^ self
		changesFromSnapshot: self workingCopySnapshot
		toSnapshot: (self loadSnapshotFrom: anFSCommit filesystem)