public-locations
workingCopyDir
	self privateDeprecatedUseUnitOfWork.
	self workingCopyDirDo: [:directory | ^ directory]
		ifBare: [GitError signal: 'Repository does not have a working copy']