utilities
newPackageInfoFor: packageName
	^ PackageInfo new packageName: packageName; yourself. "do not register"