capturing
capture: anObject withMetadata: aTrackedObjectMetadata
	"Turn anObject into an object graph. The capturing is influenced by the metadata."
	SquotCurrentMetadata
		value: aTrackedObjectMetadata
		during:
			[^ self objectGraphs
				at: anObject
				put: (SquotObjectCapturer new
					registry: self objectRegistry;
					captureGraph: anObject;
					objectGraph)]