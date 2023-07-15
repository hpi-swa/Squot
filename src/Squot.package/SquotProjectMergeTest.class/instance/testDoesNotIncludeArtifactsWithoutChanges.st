tests
testDoesNotIncludeArtifactsWithoutChanges
	| a b base merge workingArtifact |
	base := SquotWorkingCopy2 new.
	base putArtifact: (workingArtifact := SquotArtifact storeInfo: (SquotTrackedObjectMetadata withNewIdCypressPackageNamed: 'ThePackage' underPath: 'a')).
	a := base copy.
	b := SquotWorkingCopy2 new.
	b putArtifact: workingArtifact copy.
	"when"
	merge := (SquotProjectSnapshot fromStore: a) squotMergeWith: (SquotProjectSnapshot fromStore: b) basedOn: (SquotProjectSnapshot fromStore: base).
	"then"
	self deny: (merge elementMerges includesKey: workingArtifact id).