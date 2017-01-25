as yet unclassified
addPackageDirectoryForPackage: aPackageInfo to: pathElements
	^ pathElements, {aPackageInfo packageName, '.package'} joinSeparatedBy: $/