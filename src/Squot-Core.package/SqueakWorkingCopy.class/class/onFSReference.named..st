instance creation
onFSReference: anFSReference named: aString
	^ self
		onFSGitRepository: (FileSystemGitRepository on: anFSReference)
		named: aString