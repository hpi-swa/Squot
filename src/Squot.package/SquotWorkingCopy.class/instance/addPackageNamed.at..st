*Squot-Packages
addPackageNamed: packageName at: path
	| packageInfo |
	packageInfo := PackageInfo named: packageName.
	^ self addPackage: packageInfo at: path