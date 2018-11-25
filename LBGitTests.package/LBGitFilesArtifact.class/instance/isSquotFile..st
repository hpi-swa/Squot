as yet unclassified
isSquotFile: aPath

	^ (aPath includesSubString: '.squot')
		or: [aPath includesSubString: '.package']
		or: [self ownerSnapshot includesObjectAt: aPath]