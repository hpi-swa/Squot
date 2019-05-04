tests
savePackage
	class := classFactory newClass.
	class compileSilently: 'a ^ 1'.
	package := PackageInfo named: class category.
	self trackPackage.
	workingCopy saveNewVersionMessage: 'version with package' interactive: false.
	path := self packagePath.
	workingCopy removePackageNamed: package name. "untrack again"