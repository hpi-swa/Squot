private storing
storeOrdinary: anArtifact
	| serializer |
	serializer := self serializerFactoryFor: anArtifact.
	anArtifact validatePath.
	(serializer writingBelow: directory) write: anArtifact.
	self shouldStoreMetadata ifTrue: [self storeSquotMetadataFor: anArtifact].