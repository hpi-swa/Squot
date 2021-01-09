private storing
storeOrdinary: anArtifact
	| serializer storedArtifact |
	serializer := self serializerFactoryFor: anArtifact.
	storedArtifact := anArtifact.
	anArtifact serializerName ~= serializer name ifTrue:
		[storedArtifact := SquotArtifact
			path: anArtifact path
			content: anArtifact content
			storeInfo: (anArtifact storeInfo copy
						serializer: serializer;
						yourself)].
	self validatePathOf: storedArtifact.
	(serializer writingBelow: directory) write: storedArtifact.
	self rememberArtifact: storedArtifact.
	self shouldStoreMetadata ifTrue:
		[self storeSquotMetadataFor: storedArtifact.
		self tableOfContents add: storedArtifact].
	^ storedArtifact