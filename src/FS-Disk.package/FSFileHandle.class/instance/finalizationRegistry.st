finalization
finalizationRegistry
	^ Registry ifNil: [Registry := WeakRegistry new]