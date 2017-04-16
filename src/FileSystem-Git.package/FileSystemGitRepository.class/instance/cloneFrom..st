git porcelain
cloneFrom: aStringOrUrl
	| url |
	url := aStringOrUrl asUrl.
	self addRemote: 'origin' url: aStringOrUrl.
	self fetchFrom: 'origin'.
	repository allReferencesPrefixedWith: 'refs/remotes/origin'
		do: [:each | repository updateRef: 'refs/heads/', (each allButFirst: 'refs/remotes/origin/' size) to: (repository resolveRef: each)].