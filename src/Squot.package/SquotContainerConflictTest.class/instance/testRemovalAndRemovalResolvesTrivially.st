tests
testRemovalAndRemovalResolvesTrivially
	| base working incoming merge |
	base := SquotSnapshot builder
		add: (SquotArtifact new path: 'a'; content: SquotArtifactContentMock new);
		buildSnapshot.
	working := SquotSnapshot empty.
	incoming := SquotSnapshot empty.
	"when"
	merge := SquotMerge into: working merge: incoming basedOn: base.
	"then"
	self deny: (merge modifies: (base artifactAt: 'a')).