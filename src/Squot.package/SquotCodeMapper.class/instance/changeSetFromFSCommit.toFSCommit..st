changes-creation
changeSetFromFSCommit: anFSCommit toFSCommit: anotherFSCommit
	anFSCommit hash = anotherFSCommit hash ifTrue: [^ SquotEmptyChangeSet withMapper: self].
	^ self
		changeSetFromSnapshot: (self loadSnapshotFrom: anFSCommit filesystem)
		toSnapshot: (self loadSnapshotFrom: anotherFSCommit filesystem)