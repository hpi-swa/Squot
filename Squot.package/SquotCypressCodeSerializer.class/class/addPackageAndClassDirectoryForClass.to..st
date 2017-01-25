as yet unclassified
addPackageAndClassDirectoryForClass: aClass to: pathElements
	^ pathElements, {
		(aClass environment info packages packageOfClass: aClass) packageName, '.package'.
		aClass name, '.class' }
		joinSeparatedBy: $/