actions
actionImportUnmappedFiles
	self importUnmappedFilesIn:
		((self activeWorkingCopy ifNil: [^ self inform: 'Please select a project first.'])
			headFSCommit ifNil: [^ self inform: 'Please create a commit first.']).