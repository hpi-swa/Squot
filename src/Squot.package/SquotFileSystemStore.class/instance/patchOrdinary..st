private storing
patchOrdinary: anArtifactDiff
	| serializerClass serializer storedArtifact |
	self assert: anArtifactDiff isModification.
	serializerClass := self serializerFactoryFor: anArtifactDiff right.
	storedArtifact := anArtifactDiff right.
	storedArtifact serializerName ~= serializerClass name ifTrue:
		[storedArtifact := SquotArtifact
			path: storedArtifact path
			content: storedArtifact content
			storeInfo: (storedArtifact storeInfo copy
						serializer: serializerClass;
						yourself)].
	self validatePathOf: storedArtifact.
	(serializer := serializerClass writingBelow: directory) canWriteDiffs
		ifTrue:
			[serializer writeDiff: anArtifactDiff.
			self shouldStoreMetadata ifTrue:
				[self storeSquotMetadataFor: storedArtifact.
				self tableOfContents add: storedArtifact].
			^ storedArtifact]
		ifFalse: [| reference |
			reference := directory resolve: anArtifactDiff path.
			reference exists ifTrue: [reference deleteAll].
			^ self store: storedArtifact]