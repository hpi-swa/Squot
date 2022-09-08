tests
savePackageAndKeep
	self initializePackage;
		trackPackage.
	workingCopy saveVersionWithMessage: 'version with package'.
	path := self packagePath.