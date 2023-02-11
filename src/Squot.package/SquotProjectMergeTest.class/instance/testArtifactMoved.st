tests
testArtifactMoved
	"When an artifact path is changed, this should appear merely as a modification."
	| a b base artifact merge result |
	self assert: SquotToggles useNewApi.
	a := SquotWorkingCopy2 new.
	a putArtifact: (artifact := SquotArtifact storeInfo: (SquotTrackedObjectMetadata withNewIdValueHeldAtPath: 'a')).
	(a storeForArtifact: artifact) contents: 1. 
	b := a copy.
	(b project artifactAt: artifact id) path: 'b'.
	base := a copy.
	"when"
	merge := (SquotProjectSnapshot fromStore: a) squotMergeWith: (SquotProjectSnapshot fromStore: b) basedOn: (SquotProjectSnapshot fromStore: base).
	result := a copy.
	result applyMerge: merge.
	"then"
	self deny: merge hasConflicts;
		assert: (merge includesMergeAt: artifact id);
		assert: (merge mergeAt: artifact id) metadata hasChanges;
		assert: 'b' equals: (merge result artifactAt: artifact id) path;
		assert: 'b' equals: (result project artifactAt: artifact id) path;
		assert: 1 equals: (result storeForArtifact: (result project artifactAt: artifact id)) contents.