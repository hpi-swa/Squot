tests
savePackage
	SystemChangeNotifier uniqueInstance doSilently: [class := classFactory newClass].
	class compileSilently: 'a ^ 1'.
	package := PackageInfo named: class category.
	self trackPackage.
	workingCopy saveVersionWithMessage: 'version with package'.
	path := self packagePath.
	workingCopy removePackageNamed: package name. "untrack again"