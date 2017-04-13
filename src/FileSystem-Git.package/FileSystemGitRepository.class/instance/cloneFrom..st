git porcelain
cloneFrom: aStringOrUrl
	| url |
	url := aStringOrUrl asUrl.
	repository
		configAt: 'remote.origin.url' put: aStringOrUrl;
		configAt: 'remote.origin.fetch' put: '+refs/heads/*:refs/remotes/origin/*'.
	self fetchFrom: 'origin'.
	repository allReferencesPrefixedWith: 'refs/remotes/origin'
		do: [:each | repository updateRef: 'refs/heads/', (each allButFirst: 'refs/remotes/origin/' size) to: (repository resolveRef: each)].