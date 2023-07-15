tests
testMergesPackagesWithDifferentIdsButSameNamesAtSamePath
	| a b base merge workingArtifact incomingArtifact |
	base := SquotWorkingCopy2 new.
	base putArtifact: (workingArtifact := SquotArtifact storeInfo: (SquotTrackedObjectMetadata withNewIdCypressPackageNamed: 'ThePackage' underPath: 'a')).
	workingArtifact storeInfo propertyAt: #(dummy) put: 1. "to have a change in the package"
	a := base copy.
	b := SquotWorkingCopy2 new.
	b putArtifact: (incomingArtifact := SquotArtifact storeInfo: (SquotTrackedObjectMetadata withNewIdCypressPackageNamed: 'ThePackage' underPath: 'a')).
	incomingArtifact storeInfo propertyAt: #(dummy) put: 2. "to have a change in the package"
	"when"
	merge := (SquotProjectSnapshot fromStore: a) squotMergeWith: (SquotProjectSnapshot fromStore: b) basedOn: (SquotProjectSnapshot fromStore: base).
	"then"
	self assert: (merge elementMerges includesKey: workingArtifact id);
		assert: (merge mergeAt: workingArtifact id) incoming artifact = incomingArtifact;
		assert: (merge mergeAt: workingArtifact id) result artifact id = workingArtifact id. "the id of the working copy prevails"