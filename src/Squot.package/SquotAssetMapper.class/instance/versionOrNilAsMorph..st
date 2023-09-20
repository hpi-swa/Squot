toolbuilder
versionOrNilAsMorph: anObject
	^ anObject
		ifNil: [(SquotTextUtilities italic: 'Missing') asMorph]
		ifNotNil: [self versionAsMorph: anObject]