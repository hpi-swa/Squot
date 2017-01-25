as yet unclassified
addClassDirectoryForClass: aClass to: pathElements
	^ pathElements, {aClass name, '.class'} joinSeparatedBy: $/