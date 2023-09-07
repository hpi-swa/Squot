instance creation
onFSReference: anFSReference
	^ self onFSGitRepository: (FileSystemGitRepository on: anFSReference)