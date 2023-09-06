changes-creation
changeSetFromImage: aWorkingCopy toFSCommit: anFSCommit
	^ self
		changeSetFromForm: (self loadFormFromImage: aWorkingCopy)
		toForm: (self loadFormFrom: anFSCommit filesystem)