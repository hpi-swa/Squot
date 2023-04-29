changes-creation
changesFrom: anFSCommit to: anotherFSCommit
	anFSCommit hash = anotherFSCommit hash ifTrue: [^ {}].
	^ self
		changesFromForm: (self loadFormFrom: anFSCommit filesystem)
		toForm: (self loadFormFrom: anotherFSCommit filesystem)