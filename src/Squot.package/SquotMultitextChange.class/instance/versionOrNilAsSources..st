accessing-sources
versionOrNilAsSources: anObject
	^ anObject ifNotNil: [self versionAsSources: anObject]