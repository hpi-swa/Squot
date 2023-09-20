changes-creation
changeSetFromImage: aWorkingCopy toFSCommit: anFSCommit
	^ self
		changeSetFromVersion: (self loadVersionFromImage: aWorkingCopy)
		toVersion: (self loadVersionFrom: anFSCommit filesystem)