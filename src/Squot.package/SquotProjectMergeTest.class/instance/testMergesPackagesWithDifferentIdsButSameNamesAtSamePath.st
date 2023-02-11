tests
testMergesPackagesWithDifferentIdsButSameNamesAtSamePath
	| a b base merge workingArtifact incomingArtifact |
	base := SquotWorkingCopy2 new.
	base putArtifact: (workingArtifact := SquotArtifact storeInfo: (SquotTrackedObjectMetadata withNewIdCypressPackageNamed: 'ThePackage' underPath: 'a')).
	a := base copy.
	b := SquotWorkingCopy2 new.
	b putArtifact: (incomingArtifact := SquotArtifact storeInfo: (SquotTrackedObjectMetadata withNewIdCypressPackageNamed: 'ThePackage' underPath: 'a')).
	"when"
	merge := (SquotProjectSnapshot fromStore: a) squotMergeWith: (SquotProjectSnapshot fromStore: b) basedOn: (SquotProjectSnapshot fromStore: base).
	"then"
	self assert: (merge elementMerges includesKey: workingArtifact id);
		assert: (merge mergeAt: workingArtifact id) incoming artifact = incomingArtifact;
		assert: (merge mergeAt: workingArtifact id) result artifact id = workingArtifact id. "the id of the working copy prevails"