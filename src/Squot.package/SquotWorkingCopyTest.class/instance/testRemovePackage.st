tests
testRemovePackage
	self deny: (workingCopy store includes: (PackageInfo named: classFactory packageName)).
	
	workingCopy addPackageNamed: classFactory packageName at: 'src'.
	self assert: (workingCopy store includes: (PackageInfo named: classFactory packageName)).
	
	workingCopy saveNewVersionMessage: 'add package' interactive: false.
	self assert: (workingCopy store includes: (PackageInfo named: classFactory packageName)).
	
	workingCopy remove: (PackageInfo named: classFactory packageName).
	self deny: (workingCopy store includes: (PackageInfo named: classFactory packageName)).
	
	workingCopy saveNewVersionMessage: 'remove package' interactive: false.
	self deny: (workingCopy store includes: (PackageInfo named: classFactory packageName)).