private storing
patchOrdinary: anArtifactDiff
	| serializerClass serializer storedArtifact |
	self assert: anArtifactDiff isModification.
	serializerClass := self serializerFactoryFor: anArtifactDiff right.
	storedArtifact := anArtifactDiff right.
	storedArtifact := SquotArtifact
						path: anArtifactDiff right path
						content: anArtifactDiff right content
						storeInfo: anArtifactDiff right storeInfo copy.
	storedArtifact serializerName ~= serializerClass name ifTrue:
		[storedArtifact storeInfo serializer: serializerClass].
	self validatePathOf: storedArtifact.
	(anArtifactDiff left id notNil and: [storedArtifact id ~= anArtifactDiff left id]) ifTrue: "Preserve existing id"
		[storedArtifact id: anArtifactDiff left id].
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