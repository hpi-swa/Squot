tests
savePackage
	self savePackageAndKeep.
	workingCopy removePackageNamed: package name. "untrack again"