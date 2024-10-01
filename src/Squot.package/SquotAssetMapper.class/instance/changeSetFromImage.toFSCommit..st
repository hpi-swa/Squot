changes-creation
changeSetFromImage: aWorkingCopy toFSCommit: anFSCommit
	| imageAssetFile |
	imageAssetFile := self loadAssetFileFromImage: aWorkingCopy.
	(self hexHashIn: anFSCommit) = (imageAssetFile ifNotNil: #hexHash)
		ifTrue: [^ SquotEmptyChangeSet withMapper: self].
	^ self
		changeSetFromAssetFile: imageAssetFile
		toAssetFile: (self loadAssetFileFrom: anFSCommit filesystem)