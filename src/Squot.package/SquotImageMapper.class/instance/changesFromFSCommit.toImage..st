changes-creation
changesFromFSCommit: anFSCommit toImage: aWorkingCopy
	^ self
		changesFromForm: (self loadFormFrom: anFSCommit filesystem)
		toForm: (self loadFormFromImage: aWorkingCopy)