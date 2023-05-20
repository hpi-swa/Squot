changes-creation
changesFromImage: aWorkingCopy toFSCommit: anFSCommit
	^ self
		changesFromForm: (self loadFormFromImage: aWorkingCopy)
		toForm: (self loadFormFrom: anFSCommit filesystem)