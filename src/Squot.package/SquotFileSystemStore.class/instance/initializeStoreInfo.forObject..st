adding and removing
initializeStoreInfo: aTrackedObjectMetadata forObject: aShadow
	| serializer rewrittenPath |
	serializer := self serializerFactoryFrom: aTrackedObjectMetadata ifAbsent: [aShadow preferredSerializer].
	rewrittenPath := serializer rewritePath: (aTrackedObjectMetadata at: #path) for: aShadow.
	aTrackedObjectMetadata at: #path put: rewrittenPath.