accessing-references
referenceToObjectNamed: aHexHash
	| pathReference |
	pathReference := self baseDir resolve: (self looseObjectPathFor: aHexHash asHexHash).
	pathReference parent ensureDirectory.
	^ pathReference