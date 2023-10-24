merging
mergeSources
	| baseSources leftSources rightSources |
	baseSources := self baseSources.
	leftSources := self leftSources.
	rightSources := self rightSources.
	^ self sourceIndices collect: [:index |
		self mergeSourceBase: (self sources: baseSources at: index)
			left: (self sources: leftSources at: index)
			right: (self sources: rightSources at: index)]