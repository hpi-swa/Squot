changes-creation
changeSetFromFSCommit: anFSCommit toFSCommit: anotherFSCommit
	anFSCommit hash = anotherFSCommit hash ifTrue: [^ SquotEmptyChangeSet withMapper: self].
	^ self
		changeSetFromVersion: (self loadVersionFrom: anFSCommit filesystem)
		toVersion: (self loadVersionFrom: anotherFSCommit filesystem)