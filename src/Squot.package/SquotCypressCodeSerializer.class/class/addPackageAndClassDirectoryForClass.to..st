as yet unclassified
addPackageAndClassDirectoryForClass: aClass to: pathElements
	^ pathElements, {
		(aClass environment packageOrganizer packageOfClass: aClass
			ifNone: [SquotClassWithoutPackageException signalWith: aClass]) packageName, '.package'.
		aClass name, '.class' }
		joinSeparatedBy: $/