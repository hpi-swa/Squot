accessing-references
referenceTo: aGitStorableObject
	| pathReference |
	pathReference := self baseDir resolve: (self looseObjectPathFor: aGitStorableObject hexHash).
	pathReference parent ensureDirectory.
	^ pathReference