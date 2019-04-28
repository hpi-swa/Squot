as yet unclassified
isSquotFile: aPath

	^ (aPath includesSubstring: '.squot')
		or: [aPath includesSubstring: '.package']
		or: [self objectContainer includesObjectAt: aPath]