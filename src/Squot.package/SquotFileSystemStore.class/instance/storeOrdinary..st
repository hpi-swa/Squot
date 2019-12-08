private storing
storeOrdinary: anArtifact
	| serializer |
	serializer := self serializerFactoryFor: anArtifact.
	self validatePathOf: anArtifact.
	(serializer writingBelow: directory) write: anArtifact.
	self shouldStoreMetadata ifTrue:
		[self storeSquotMetadataFor: anArtifact.
		self tableOfContents add: anArtifact].