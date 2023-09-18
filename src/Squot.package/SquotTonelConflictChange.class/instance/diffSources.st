ui
diffSources
	^ (1 to: self sourcesSize) collect: [:index |
		SquotTextUtilities
			diffFrom: (self sources: self leftSources at: index)
			to: (self sources: self resolutionSources at: index)]