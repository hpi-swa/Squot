accessing-references
referenceToObjectNamed: aHexHash
	| pathReference |
	self privateDeprecatedUseUnitOfWork.
	pathReference := self baseDir resolve: (self looseObjectPathFor: aHexHash asHexHash).
	pathReference parent ensureDirectory.
	^ pathReference