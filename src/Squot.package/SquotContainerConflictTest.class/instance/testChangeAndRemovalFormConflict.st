tests
testChangeAndRemovalFormConflict
	| base working incoming merge |
	base := SquotSnapshot builder
		add: (SquotArtifact new path: 'a'; content: SquotArtifactContentMock new);
		buildSnapshot.
	working := SquotSnapshot builder
		add: (SquotArtifact new path: 'a'; content: SquotArtifactContentMock new);
		buildSnapshot.
	incoming := SquotSnapshot empty.
	(base artifactAt: 'a') content whenComparedReturnMock.
	"when"
	merge := SquotMerge into: working merge: incoming basedOn: base.
	"then"
	self assert: (merge at: 'a') isConflict.