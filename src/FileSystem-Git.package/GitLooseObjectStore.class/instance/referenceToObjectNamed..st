private
referenceToObjectNamed: aHexHash
	| pathReference |
	pathReference := repository baseDir resolve: (self looseObjectPathFor: aHexHash asHexHash).
	pathReference parent ensureDirectory.
	^ pathReference