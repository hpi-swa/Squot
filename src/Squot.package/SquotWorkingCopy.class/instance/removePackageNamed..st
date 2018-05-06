adding and removing
removePackageNamed: packageName
	^ self remove: (PackageInfo named: packageName)