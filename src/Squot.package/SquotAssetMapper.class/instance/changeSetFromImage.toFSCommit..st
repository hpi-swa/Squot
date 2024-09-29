changes-creation
changeSetFromImage: aWorkingCopy toFSCommit: anFSCommit
	^ self
		changeSetFromAssetFile: (self loadAssetFileFromImage: aWorkingCopy)
		toAssetFile: (self loadAssetFileFrom: anFSCommit filesystem)