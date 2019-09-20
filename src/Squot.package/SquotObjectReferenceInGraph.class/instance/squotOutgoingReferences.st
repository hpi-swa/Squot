accessing
squotOutgoingReferences
	^ decoratedObject squotOutgoingReferences collect: [:each | each inGraph: graph]