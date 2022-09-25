accessing artifacts
readArtifact: anArtifact
	"Turn anObject into an object graph. The capturing is influenced by the metadata."
	self assert: (artifact isNil or: [anArtifact id = artifact id]).
	^ SquotCurrentMetadata
		value: anArtifact storeInfo
		during:
			[SquotArtifactSnapshot
				artifact: anArtifact
				objectSnapshot:
					(SquotObjectCapturer new
						registry: self objectRegistry;
						captureGraph: self contents;
						objectGraph) asShadowGraph]