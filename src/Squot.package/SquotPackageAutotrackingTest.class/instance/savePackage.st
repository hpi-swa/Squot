tests
savePackage
	self initializePackage;
		trackPackage.
	workingCopy saveVersionWithMessage: 'version with package'.
	path := self packagePath.
	workingCopy removePackageNamed: package name. "untrack again"