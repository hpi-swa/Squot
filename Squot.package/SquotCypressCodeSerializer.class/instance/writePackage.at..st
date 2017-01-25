as yet unclassified
writePackage: aPackageInfo at: pathString
	currentDirectory := snapshotBuilder at: pathString.
	currentDirectory ensureDirectory.
	fileTreeWriter directory: currentDirectory pathString.
	definitions addAll: aPackageInfo mcPackage snapshot definitions. self flag: #hack.