testing
needsChoice
	^ topNodes anySatisfy: [:anyTop |
		anyTop withAllChildren anySatisfy: [:anyChild | anyChild needsChoice]]