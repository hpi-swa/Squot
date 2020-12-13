tests
testMetadataModification
	| object snapshot changed diff |
	object := SquotTestObjectWithTransientMetadata new.
	imageStore add: object at: 'example'.
	snapshot := (imageStore artifactAt: 'example') snapshot.
	changed := snapshot copy.
	changed storeInfo at: #dummy put: {1. 2}.
	(imageStore metadataForObjectAt: 'example')
		at: #transient put: 2;
		at: #dummy put: {2. 1}.
	self assert: {2. 1} equals: ((imageStore metadataForObjectAt: 'example') at: #dummy);
		assert: 2 equals: ((imageStore metadataForObjectAt: 'example') at: #transient).
	"when"
	diff := snapshot diffAgainst: changed.
	imageStore applyDiff: diff toObjectAt: 'example'.
	"then"
	self assert: {2. 2} equals: ((imageStore metadataForObjectAt: 'example') at: #dummy);
		assert: 2 equals: ((imageStore metadataForObjectAt: 'example') at: #transient).