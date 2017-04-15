caching
objectCacheRefresh
	commitForCache = self commitSelection ifTrue: [^ self].
	objectCache := self commitSelection
		ifNil: [#()]
		ifNotNil: [:commit |
			commitForCache := commit.
			commit snapshot artifacts values
				collect: [:artifact | SquitArtifactWrapper on: artifact]]