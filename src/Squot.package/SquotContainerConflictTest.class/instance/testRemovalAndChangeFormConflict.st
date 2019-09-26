tests
testRemovalAndChangeFormConflict
	| base working incoming merge |
	base := SquotSnapshot builder
		add: (SquotArtifact new path: 'a'; content: SquotArtifactContentMock new);
		buildSnapshot.
	working := SquotSnapshot empty.
	incoming := SquotSnapshot builder
		add: (SquotArtifact new path: 'a'; content: SquotArtifactContentMock new);
		buildSnapshot.
	(base artifactAt: 'a') content whenComparedReturnMock.
	"when"
	merge := SquotMerge into: working merge: incoming basedOn: base.
	"then"
	self assert: (merge at: 'a') isConflict.