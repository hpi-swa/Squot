testing
needsChoice
	^ topNodes withAllChildren anySatisfy: [:any | any needsChoice]