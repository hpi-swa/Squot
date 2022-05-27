adding and removing
initializeStoreInfo: aTrackedObjectMetadata forObject: aSnapshot
	| serializer rewrittenPath |
	serializer := self serializerFactoryFrom: aTrackedObjectMetadata ifAbsent: [aSnapshot preferredSerializer].
	rewrittenPath := serializer rewritePath: (aTrackedObjectMetadata at: #path) for: aSnapshot.
	aTrackedObjectMetadata at: #path put: rewrittenPath.