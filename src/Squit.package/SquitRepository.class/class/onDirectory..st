instance creation
onDirectory: aDirectoryReference
	^ self new
		initializeWith: (FileSystemGitRepository on: aDirectoryReference);
		yourself