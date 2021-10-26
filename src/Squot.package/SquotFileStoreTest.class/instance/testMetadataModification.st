tests
testMetadataModification
	| metadata changed diff |
	metadata := SquotTrackedObjectMetadata new.
	metadata
		at: #dummy put: {1};
		at: #toBeRemoved put: 'yes';
		serializer: SquotStonFileCodec.
	fileStore add: (SquotArtifact new
					path: 'example';
					content: (SquotShadowGraph new startShadow: true captureWithSquot);
					storeInfo: metadata;
					yourself).
	changed := (fileStore artifactAt: 'example') snapshot copy.
	changed storeInfo
		at: #dummy put: {2};
		removeKey: #toBeRemoved.
	"when"
	diff := (fileStore artifactAt: 'example') diffAgainst: changed.
	fileStore applyDiff: diff toObjectAt: 'example'.
	"then"
	self assert: {2} equals: ((fileStore artifactAt: 'example') storeInfo at: #dummy);
		deny: ((fileStore artifactAt: 'example') storeInfo includesKey: #toBeRemoved).