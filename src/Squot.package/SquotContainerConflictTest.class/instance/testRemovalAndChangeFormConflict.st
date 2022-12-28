tests
testRemovalAndChangeFormConflict
	| base working incoming merge |
	SquotToggles useNewApi ifTrue:
		[| artifactA valueHolder |
		base := SquotWorkingCopy2 new
			putArtifact: (artifactA := SquotArtifact storeInfo: (SquotTrackedObjectMetadata withNewIdValueHeldAtPath: 'a'));
			yourself.
		valueHolder := ValueHolder new contents: 1; yourself.
		(base storeForArtifact: artifactA) contents: valueHolder. "Avoid start object replacement with 1 and 2 because the older diffing implementation does not deal well with it."
		SquotObjectStore objectRegistry assign: {UUID nilUUID} to: valueHolder.
		working := base copy.
		working project removeArtifactAt: artifactA id.
		incoming := base copy.
		(incoming storeForArtifact: artifactA) contents: valueHolder copy.
		SquotObjectStore objectRegistry assign: (SquotObjectStore objectRegistry nameOf: valueHolder) to: (incoming storeForArtifact: artifactA) contents.
		(incoming storeForArtifact: artifactA) contents contents: 2.
		"when"
		merge := (SquotProjectSnapshot fromStore: working) squotMergeWith: (SquotProjectSnapshot fromStore: incoming) basedOn: (SquotProjectSnapshot fromStore: base).
		"then"
		merge conflictAt: artifactA id ifAbsent: [self fail: 'conflict expected'].
		^ self].
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