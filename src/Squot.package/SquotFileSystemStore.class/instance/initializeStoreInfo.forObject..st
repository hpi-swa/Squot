adding and removing
initializeStoreInfo: aTrackedObjectMetadata forObject: aShadow
	| serializer rewrittenPath |
	SquotToggles useNewApi ifTrue:
		[| tempArtifact storeImplementation store |
		tempArtifact := SquotArtifact storeInfo: aTrackedObjectMetadata.
		storeImplementation := SquotFileSystemObjectStore detectImplementation: [:each | each canStore: (SquotArtifact storeInfo: aTrackedObjectMetadata)] ifNone: [self error: 'No suitable store'].
		store := storeImplementation forArtifact: tempArtifact inDirectory: directory.
		store initializeStoreInfo: aTrackedObjectMetadata forObject: aShadow.
		^ self].
	serializer := self serializerFactoryFrom: aTrackedObjectMetadata ifAbsent: [aShadow preferredSerializer].
	rewrittenPath := serializer rewritePath: (aTrackedObjectMetadata at: #path) for: aShadow.
	aTrackedObjectMetadata at: #path put: rewrittenPath.