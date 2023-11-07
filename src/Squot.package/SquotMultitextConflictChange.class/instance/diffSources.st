ui
diffSources
	^ self sourceIndices collect: [:index |
		SquotTextUtilities
			diffFrom: (self sources: self leftSources at: index)
			to: (self sources: self resolutionSources at: index)]