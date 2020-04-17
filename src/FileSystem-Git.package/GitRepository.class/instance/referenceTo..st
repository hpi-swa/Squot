accessing-references
referenceTo: aGitStorableObject
	self privateDeprecatedUseUnitOfWork.
	^ self referenceToObjectNamed: aGitStorableObject hexHash