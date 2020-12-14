tests
testMetadataModification
	| metadata snapshot changed diff |
	metadata := SquotTrackedObjectMetadata new.
	metadata
		at: #dummy put: {1};
		serializer: SquotStonFileCodec.
	fileStore add: (SquotArtifact new
					path: 'example';
					content: (SquotShadowGraph new startShadow: true);
					storeInfo: metadata;
					yourself).
	snapshot := (fileStore artifactAt: 'example') snapshot.
	changed := snapshot copy.
	changed storeInfo at: #dummy put: {2}.
	"when"
	diff := (fileStore artifactAt: 'example') diffAgainst: changed.
	fileStore applyDiff: diff toObjectAt: 'example'.
	"then"
	self assert: {2} equals: ((fileStore artifactAt: 'example') storeInfo at: #dummy).