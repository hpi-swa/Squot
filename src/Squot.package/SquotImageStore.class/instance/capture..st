capturing
capture: anObject
	^ self objectGraphs
		at: anObject
		put: (SquotObjectCapturer new
			registry: self objectRegistry;
			captureGraph: anObject;
			objectGraph)