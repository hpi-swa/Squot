changes-creation
changeSetFromFSCommit: anFSCommit toFSCommit: anotherFSCommit
	(self hexHashIn: anFSCommit) = (self hexHashIn: anotherFSCommit)
		ifTrue: [^ SquotEmptyChangeSet withMapper: self].
	^ self
		changeSetFromSnapshot: (self loadSnapshotFrom: anFSCommit filesystem)
		toSnapshot: (self loadSnapshotFrom: anotherFSCommit filesystem)