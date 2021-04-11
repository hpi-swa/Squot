reflection
reflect: anObject in: aMirror put: newValue
	self halt. "Should not be used during materialization."
	^ actualReference reflect: anObject in: aMirror put: newValue