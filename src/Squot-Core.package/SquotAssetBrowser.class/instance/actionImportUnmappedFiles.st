actions
actionImportUnmappedFiles
	self importUnmappedFilesIn:
		((self activeWorkingCopyIfNilInformAnd: [^ self])
			headFSCommitIfNilInformAnd: [^ self]).