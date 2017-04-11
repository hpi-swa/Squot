caching
objectCacheRefresh
	commitForCache = self commitSelection ifTrue: [^ self].
	objectCache := self commitSelection
		ifNil: [#()]
		ifNotNil: [:commit |
			commitForCache := commit.
			commit version snapshot artifacts values
				collect: [:artifact | SquitArtifactWrapper on: artifact]]