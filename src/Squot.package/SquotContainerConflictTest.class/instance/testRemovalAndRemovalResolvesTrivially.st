tests
testRemovalAndRemovalResolvesTrivially
	| base working incoming merge |
	SquotToggles useNewApi ifTrue:
		[| artifactA |
		base := SquotWorkingCopy2 new
			putArtifact: (artifactA := SquotArtifact storeInfo: (SquotTrackedObjectMetadata withNewIdValueHeldAtPath: 'a'));
			yourself.
		(base storeForArtifact: artifactA) contents: 1.
		working := base copy.
		working project removeArtifactAt: artifactA id.
		incoming := base copy.
		incoming project removeArtifactAt: artifactA id.
		"when"
		merge := SquotProjectMergeFactory new merge: (SquotProjectSnapshot fromStore: incoming) into: (SquotProjectSnapshot fromStore: working) basedOn: (SquotProjectSnapshot fromStore: base).
		"then"
		self deny: (merge modifies: artifactA).
		^ self].
	base := SquotSnapshot builder
		add: (SquotArtifact new path: 'a'; content: SquotArtifactContentMock new);
		buildSnapshot.
	working := SquotSnapshot empty.
	incoming := SquotSnapshot empty.
	"when"
	merge := SquotMerge into: working merge: incoming basedOn: base.
	"then"
	self deny: (merge modifies: (base artifactAt: 'a')).