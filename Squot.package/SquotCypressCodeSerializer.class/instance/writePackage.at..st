as yet unclassified
writePackage: aPackageInfo at: pathString
	currentDirectory := snapshotBuilder at: pathString, '/', (aPackageInfo packageName), '.package'.
	currentDirectory ensureDirectory.
	fileTreeWriter directory: currentDirectory pathString.
	definitions addAll: aPackageInfo mcPackage snapshot definitions. self flag: #hack.