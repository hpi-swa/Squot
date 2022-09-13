tests
testPreservesIdOfWorkingCopy
	| a b c merge result originalId |
	a := SquotArtifact new path: 'p'; content: SquotArtifactContentMock new.
	originalId := a id.
	b := a copy content: SquotArtifactContentMock new.
	b id: UUID new.
	c := a copy content: SquotArtifactContentMock new.
	c id: UUID new.
	"When merging artifact versions with different ids, keep the id from the working copy."
	merge := SquotArtifactMerge into: a merge: b basedOn: c willBeLoaded: false graphMerge: (SquotObjectGraphMerge into: (SquotShadowGraph new startShadow: true) merge: (SquotShadowGraph new startShadow: true) basedOn: (SquotShadowGraph new startShadow: true)) metadataMerge: (a storeInfo squotMergeWith: b storeInfo basedOn: c storeInfo).
	result := a copyWithDiffApplied: merge resolvedPatch.
	self assert: originalId equals: result id;
		assert: originalId equals: (result storeInfo at: #id).