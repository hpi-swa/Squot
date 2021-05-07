tests
testMergeMetadataWithoutConflicts
	| a b c merge result |
	a := SquotArtifact new path: 'p'; content: SquotArtifactContentMock new.
	a storeInfo at: #dummy put: 1.
	b := a copy content: SquotArtifactContentMock new.
	b storeInfo at: #dummy put: 2.
	c := a copy content: SquotArtifactContentMock new.
	"when"
	merge := SquotArtifactMerge into: a merge: b basedOn: c willBeLoaded: false graphMerge: (SquotObjectGraphMerge into: (SquotShadowGraph new startShadow: true) merge: (SquotShadowGraph new startShadow: true) basedOn: (SquotShadowGraph new startShadow: true)) metadataMerge: (a storeInfo squotMergeWith: b storeInfo basedOn: c storeInfo).
	result := a copyWithDiffApplied: merge resolvedPatch.
	"then"
	self deny: merge hasConflicts.
	self assert: 2 equals: (result storeInfo at: #dummy).