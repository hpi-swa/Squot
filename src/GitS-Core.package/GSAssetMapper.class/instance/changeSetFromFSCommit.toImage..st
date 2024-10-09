changes-creation
changeSetFromFSCommit: anFSCommit toImage: aWorkingCopy
	| imageAssetFile |
	imageAssetFile := self loadAssetFileFromImage: aWorkingCopy.
	(self hexHashIn: anFSCommit) = (imageAssetFile ifNotNil: #hexHash)
		ifTrue: [^ GSEmptyChangeSet withMapper: self].
	^ self
		changeSetFromAssetFile: (self loadAssetFileFrom: anFSCommit filesystem)
		toAssetFile: imageAssetFile