testing
needsChoice
	^ self topNodes anySatisfy: [:anyTop | anyTop anyChildNeedsChoice]