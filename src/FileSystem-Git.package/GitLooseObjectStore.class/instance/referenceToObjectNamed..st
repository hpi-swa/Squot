private
referenceToObjectNamed: aHexHash
	| pathReference |
	pathReference := baseDir resolve: (self looseObjectPathFor: aHexHash asHexHash).
	pathReference parent ensureDirectory.
	^ pathReference