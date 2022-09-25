failures
expectedFailures
	SquotToggles useNewApi ifFalse: [^ super expectedFailures].
	^ self class testSelectors "Path negotiation is obsolete with the new API"