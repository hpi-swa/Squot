instance creation
repository: aSquitRepository remote: aGitRemote
	self flag: #remoteRepository.
	^ self new
		setRepository: aSquitRepository
		remote: aGitRemote;
		yourself.