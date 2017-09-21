as yet unclassified
addPackageDirectoryForPackage: aPackageShadow to: pathElements
	^ pathElements, {aPackageShadow packageName, '.package'} joinSeparatedBy: $/