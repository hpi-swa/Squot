changes-creation
changeSetFromImage: aWorkingCopy toFSCommit: anFSCommit
	| imageAssetFile |
	imageAssetFile := self loadAssetFileFromImage: aWorkingCopy.
	(self hexHashIn: anFSCommit) = (imageAssetFile ifNotNil: #hexHash)
		ifTrue: [^ GSEmptyChangeSet withMapper: self].
	^ self
		changeSetFromAssetFile: imageAssetFile
		toAssetFile: (self loadAssetFileFrom: anFSCommit filesystem)