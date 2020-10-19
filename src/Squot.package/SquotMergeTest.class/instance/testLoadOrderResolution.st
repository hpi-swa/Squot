tests
testLoadOrderResolution
	| a b base merge |
	base := SquotSnapshot empty.
	a := SquotSnapshot builder
		add: (SquotArtifactMock new path: 'a');
		buildSnapshot.
	b := SquotSnapshot builder
		add: (SquotArtifactMock new path: 'b');
		buildSnapshot.
	"when"
	merge := SquotMerge into: a merge: b basedOn: base.
	self assert: #('a' 'b') asBag = (merge resolvedPatch applyToLoadOrder: a loadOrder) asBag.