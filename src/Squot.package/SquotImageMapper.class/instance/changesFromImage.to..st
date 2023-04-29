changes-creation
changesFromImage: aWorkingCopy to: anFSCommit
	^ self
		changesFromForm: (self loadFormFromImage: aWorkingCopy)
		toForm: (self loadFormFrom: anFSCommit filesystem)