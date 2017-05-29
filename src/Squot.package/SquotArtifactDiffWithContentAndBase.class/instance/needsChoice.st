testing
needsChoice
	^ topNodes anySatisfy: [:anyTop | anyTop anyChildNeedsChoice]