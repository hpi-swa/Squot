as yet unclassified
onFSReference: anFSReference
	^ self onFSGitRepository: (FileSystemGitRepository on: anFSReference)