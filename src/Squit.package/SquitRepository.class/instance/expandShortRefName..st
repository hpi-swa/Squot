Pur repository
expandShortRefName: aString
	"Prepend refs/heads/ to branch names like 'master' or 'feature/xyz'
	and resolve symbolic references."
	^ (aString beginsWith: 'refs/')
		ifTrue: [aString]
		ifFalse: [self flag: #hack.
			(gitRepository repository expandRef: aString)
			ifNotNil: [:expandedRef | expandedRef]
			ifNil: ['refs/heads/', aString]]