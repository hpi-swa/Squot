private storing
storeOrdinary: anArtifact
	| serializer |
	serializer := self serializerFactoryFor: anArtifact.
	(serializer writingBelow: directory) write: anArtifact.
	self shouldStoreMetadata ifTrue: [self storeSquotMetadataFor: anArtifact].