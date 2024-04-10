moving
moveToNewRepositoryLocation: anFSReference
	self fsgitRepository: (FileSystemGitRepository on: anFSReference).