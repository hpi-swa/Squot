guessing
forgeLazyArtifactAt: aFSReference deserializerFactory: deserializerClass serializerFactory: serializerClass objectClass: aClass
	| artifact metadata |
	^ (artifact := SquotLazyArtifact new)
		path: (self pathOf: aFSReference);
		onLoadContent: [deserializerClass new
							fillContentOf: artifact from: aFSReference];
		onLoadStoreInfo: [metadata := SquotTrackedObjectMetadata new.
							metadata serializer: serializerClass.
							aClass basicNew squotInitializeStoreInfo: metadata.
							metadata];
		yourself