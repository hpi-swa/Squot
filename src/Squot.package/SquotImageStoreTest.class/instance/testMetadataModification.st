tests
testMetadataModification
	| object changed diff |
	object := SquotTestObjectWithTransientMetadata new.
	imageStore add: object at: 'example'.
	(imageStore metadataForObjectAt: 'example') at: #toBeRemoved put: 'yes'.
	changed := (imageStore artifactAt: 'example') snapshot copy.
	changed storeInfo
		at: #dummy put: {2};
		removeKey: #toBeRemoved.
	(imageStore metadataForObjectAt: 'example')
		at: #transient put: 2;
		at: #dummy put: {1}.
	self assert: {1} equals: ((imageStore metadataForObjectAt: 'example') at: #dummy);
		assert: 2 equals: ((imageStore metadataForObjectAt: 'example') at: #transient);
		assert: ((imageStore metadataForObjectAt: 'example') includesKey: #toBeRemoved).
	"when"
	diff := (imageStore artifactAt: 'example') diffAgainst: changed.
	imageStore applyDiff: diff toObjectAt: 'example'.
	"then"
	self assert: {2} equals: ((imageStore metadataForObjectAt: 'example') at: #dummy);
		assert: 2 equals: ((imageStore metadataForObjectAt: 'example') at: #transient);
		assert: ((imageStore metadataForObjectAt: 'example') includesKey: #toBeRemoved) not.