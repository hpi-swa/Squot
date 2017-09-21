as yet unclassified
addPackageAndClassDirectoryForClass: aClassShadow to: pathElements
	^ pathElements, {
		aClassShadow packageName, '.package'.
		aClassShadow className, '.class' }
		joinSeparatedBy: $/