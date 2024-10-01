changes-creation
changeSetFromFSCommit: anFSCommit toFSCommit: anotherFSCommit
	(self hexHashIn: anFSCommit) = (self hexHashIn: anotherFSCommit)
		ifTrue: [^ SquotEmptyChangeSet withMapper: self].
	^ self
		changeSetFromAssetFile: (self loadAssetFileFrom: anFSCommit filesystem)
		toAssetFile: (self loadAssetFileFrom: anotherFSCommit filesystem)