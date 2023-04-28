changes-creation
changesFrom: anFSCommit to: anotherFSCommit
	anFSCommit hash = anotherFSCommit hash ifTrue: [^ {}].
	^ self
		changesFromSnapshot: (self loadSnapshotFrom: anFSCommit filesystem)
		toSnapshot: (self loadSnapshotFrom: anotherFSCommit filesystem)