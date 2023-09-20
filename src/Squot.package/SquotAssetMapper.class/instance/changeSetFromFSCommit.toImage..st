changes-creation
changeSetFromFSCommit: anFSCommit toImage: aWorkingCopy
	^ self
		changeSetFromVersion: (self loadVersionFrom: anFSCommit filesystem)
		toVersion: (self loadVersionFromImage: aWorkingCopy)