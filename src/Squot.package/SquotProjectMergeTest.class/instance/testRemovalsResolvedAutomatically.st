tests
testRemovalsResolvedAutomatically
	"When an artifact is removed in both versions, there should be no load order conflict."
	| a b base merge |
	self assert: SquotToggles useNewApi.
	a := SquotWorkingCopy2 new.
	b := a copy.
	base := a copy
		putArtifact: (SquotArtifact storeInfo: (SquotTrackedObjectMetadata withNewIdValueHeldAtPath: 'a'));
		yourself.
	"when"
	merge := (SquotProjectSnapshot fromStore: a) squotMergeWith: (SquotProjectSnapshot fromStore: b) basedOn: (SquotProjectSnapshot fromStore: base).
	"then"
	self deny: merge hasConflicts.