tests
testPreservesIdOfWorkingCopy
	| a b c merge result originalId |
	a := SquotArtifact new path: 'p'; yourself.
	SquotToggles useNewApi ifFalse: [a content: SquotArtifactContentMock new].
	originalId := a id.
	b := a copy.
	SquotToggles useNewApi ifFalse: [b content: SquotArtifactContentMock new].
	b id: UUID new.
	c := a copy.
	SquotToggles useNewApi ifFalse: [c content: SquotArtifactContentMock new].
	c id: UUID new.
	"When merging artifact versions with different ids, keep the id from the working copy."
	merge := SquotArtifactMerge into: a merge: b basedOn: c willBeLoaded: false graphMerge: (SquotObjectGraphMerge into: (SquotShadowGraph new startShadow: true) merge: (SquotShadowGraph new startShadow: true) basedOn: (SquotShadowGraph new startShadow: true)) metadataMerge: (a storeInfo squotMergeWith: b storeInfo basedOn: c storeInfo).
	result := a copyWithDiffApplied: merge resolvedPatch.
	self assert: originalId equals: result id;
		assert: originalId equals: (result storeInfo at: #id).