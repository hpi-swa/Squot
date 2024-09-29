changes-creation
changeSetFromFSCommit: anFSCommit toImage: aWorkingCopy
	^ self
		changeSetFromAssetFile: (self loadAssetFileFrom: anFSCommit filesystem)
		toAssetFile: (self loadAssetFileFromImage: aWorkingCopy)