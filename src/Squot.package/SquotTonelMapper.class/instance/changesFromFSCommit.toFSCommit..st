changes-creation
changesFromFSCommit: anFSCommit toFSCommit: anotherFSCommit
	anFSCommit hash = anotherFSCommit hash ifTrue: [^ {}].
	^ self
		changesFromSnapshot: (self loadSnapshotFrom: anFSCommit filesystem)
		toSnapshot: (self loadSnapshotFrom: anotherFSCommit filesystem)