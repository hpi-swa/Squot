changes-creation
changeSetFromFSCommit: anFSCommit toImage: aWorkingCopy
	^ self
		changeSetFromForm: (self loadFormFrom: anFSCommit filesystem)
		toForm: (self loadFormFromImage: aWorkingCopy)