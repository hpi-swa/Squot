caching
objectCacheRefresh
	commitForCache = self commitSelection ifTrue: [^ self].
	objectCache := self commitSelection
		ifNil: [#()]
		ifNotNil: [:commit |
			self withUnitOfWork:
				[commitForCache := commit.
				(commit artifacts values
					collect: [:artifact | SquitArtifactWrapper on: artifact]) sorted]]