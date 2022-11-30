tests
testPatchingPreservesId
	| metadata changed diff originalId |
	metadata := SquotTrackedObjectMetadata new.
	metadata at: #dummy put: 1.
	fileStore add: (SquotArtifact new
					path: 'example';
					content: (SquotShadowGraph new startShadow: true captureWithSquot);
					storeInfo: metadata;
					yourself).
	originalId := (fileStore artifactAt: 'example') id.
	self assert: originalId notNil.
	changed := (fileStore artifactAt: 'example') snapshot copy.
	changed id: UUID new.
	changed storeInfo at: #dummy put: 2.
	"when"
	diff := (fileStore artifactAt: 'example') diffAgainst: changed.
	fileStore applyDiff: diff toObjectAt: 'example'.
	"then"
	self assert: originalId equals: (fileStore artifactAt: 'example') id.