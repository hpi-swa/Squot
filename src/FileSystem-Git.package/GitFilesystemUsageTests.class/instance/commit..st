helpers
commit: message
	self withUnitOfWork: [:git |
	workingCopy commit: message.
	GitFSCK validate: basicRepository.
	].