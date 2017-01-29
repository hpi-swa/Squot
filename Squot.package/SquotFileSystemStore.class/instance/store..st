private snapshot building
store: anArtifact
	| serializer |
	serializer := self serializerFactoryFor: anArtifact.
	(serializer writingBelow: directory) write: anArtifact.
	self storeSquotMetadataFor: anArtifact.