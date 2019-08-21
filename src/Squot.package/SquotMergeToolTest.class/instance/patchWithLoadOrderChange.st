tests
patchWithLoadOrderChange
	| artifact1 artifact2 original merge |
	artifact1 := SquotArtifact new path: '1'; content: SquotArtifactContentMock new; yourself.
	artifact2 := SquotArtifact new path: '2'; content: SquotArtifactContentMock new; yourself.
	artifact1 content whenComparedWith: artifact1 content return: SquotDiffOfEqualObjects new.
	artifact2 content whenComparedWith: artifact2 content return: SquotDiffOfEqualObjects new.
	merge := SquotMerge
		into: (original := SquotSnapshot builder add: artifact1; add: artifact2; buildSnapshot)
		merge: (original createNewBuilder loadOrder: #('2' '1'); buildSnapshot)
		basedOn: original.
	^ merge