toolbuilder
versionAsMorph: anObject
	^ anObject
		ifNil: [(SquotTextUtilities italic: 'Missing') asMorph]
		ifNotNil: [self mapper versionAsMorph: anObject]