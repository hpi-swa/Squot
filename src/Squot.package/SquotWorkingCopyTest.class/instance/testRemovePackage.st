tests
testRemovePackage
	self deny: (workingCopy store includes: (PackageInfo named: classFactory packageName)).
	
	self addPackage.
	self assert: (workingCopy store includes: (PackageInfo named: classFactory packageName)).
	
	workingCopy saveVersionWithMessage: 'add package'.
	self assert: (workingCopy store includes: (PackageInfo named: classFactory packageName)).
	
	workingCopy remove: (PackageInfo named: classFactory packageName).
	self deny: (workingCopy store includes: (PackageInfo named: classFactory packageName)).
	
	workingCopy saveVersionWithMessage: 'remove package'.
	self deny: (workingCopy store includes: (PackageInfo named: classFactory packageName)).