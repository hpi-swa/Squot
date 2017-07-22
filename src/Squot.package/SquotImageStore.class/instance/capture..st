capturing
capture: anObject
	^ self objectGraphs
		at: anObject
		put: (SquotObjectCapturer new
			registry: self objectRegistry;
			capture: anObject;
			objectGraph)