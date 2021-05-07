accessing
addPackage
	| packageInfo |
	packageInfo := PackageInfo named: classFactory packageName.
	workingCopy add: packageInfo at: packageInfo name, '.package'.
	^ packageInfo