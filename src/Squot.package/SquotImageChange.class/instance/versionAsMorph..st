toolbuilder
versionAsMorph: aFormOrNil
	^ (aFormOrNil
		ifNil: [SquotTextUtilities italic: 'Missing'])
		asMorph