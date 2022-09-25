tests
testUnrelatedNewArtifactsAreAppendedWithoutConflicts
	| a b base merge |
	base := SquotWorkingCopy2 new.
	a := SquotWorkingCopy2 new
		putArtifact: (SquotArtifact storeInfo: (SquotTrackedObjectMetadata withNewIdValueHeldAtPath: 'a'));
		yourself.
	b := SquotWorkingCopy2 new
		putArtifact: (SquotArtifact storeInfo: (SquotTrackedObjectMetadata withNewIdValueHeldAtPath: 'b'));
		yourself.
	"when"
	merge := SquotProjectMergeFactory new merge: (SquotProjectSnapshot fromStore: b) into: (SquotProjectSnapshot fromStore: a) basedOn: (SquotProjectSnapshot fromStore: base).
	"then"
	self deny: merge hasConflicts.
	self assert: #('a' 'b') asBag equals: (merge result artifacts asArray collect: [:each | each path]) asBag.