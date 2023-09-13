ui
diffSources
	^ self leftSources with: self resolutionSources collect: [:leftSource :resolutionSource |
		SquotTextUtilities diffFrom: leftSource to: resolutionSource]