changes-creation
changeSetFromFSCommit: anFSCommit toFSCommit: anotherFSCommit
	anFSCommit hash = anotherFSCommit hash ifTrue: [^ SquotEmptyChangeSet withMapper: self].
	^ self
		changeSetFromForm: (self loadFormFrom: anFSCommit filesystem)
		toForm: (self loadFormFrom: anotherFSCommit filesystem)