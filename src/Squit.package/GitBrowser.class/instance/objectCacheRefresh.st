accessing
objectCacheRefresh
	objectCache := self commitSelection
		ifNil: [#()]
		ifNotNil: [:commit |
			commit version snapshot artifacts values
				collect: [:artifact | SquitArtifactWrapper on: artifact]]