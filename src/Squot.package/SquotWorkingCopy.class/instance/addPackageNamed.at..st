adding and removing
addPackageNamed: packageName at: path
	^ self add: (PackageInfo named: packageName) at: path