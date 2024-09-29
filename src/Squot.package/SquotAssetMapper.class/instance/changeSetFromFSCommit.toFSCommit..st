changes-creation
changeSetFromFSCommit: anFSCommit toFSCommit: anotherFSCommit
	anFSCommit hash = anotherFSCommit hash ifTrue: [^ SquotEmptyChangeSet withMapper: self].
	^ self
		changeSetFromAssetFile: (self loadAssetFileFrom: anFSCommit filesystem)
		toAssetFile: (self loadAssetFileFrom: anotherFSCommit filesystem)