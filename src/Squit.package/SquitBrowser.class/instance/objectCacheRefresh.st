caching
objectCacheRefresh
	commitForCache = self commitSelection ifTrue: [^ self].
	objectCache := self commitSelection
		ifNil: [#()]
		ifNotNil: [:commit |
			commitForCache := commit.
			(commit lazyArtifacts values
				collect: [:artifact | SquitArtifactWrapper on: artifact]) sorted]