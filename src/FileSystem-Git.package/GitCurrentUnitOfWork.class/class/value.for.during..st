accessing
value: aGitUnitOfWork for: anObject during: aBlock
	"Sets the current value for the variable and register it for the given object (usually a repository) during aBlock."
	| before |
	before := Registry at: anObject ifAbsent: [].
	Registry at: anObject put: aGitUnitOfWork.
	^ [self value: aGitUnitOfWork during: aBlock]
		ensure:
			[before
				ifNil: [Registry removeKey: anObject]
				ifNotNil: [Registry at: anObject put: before]].