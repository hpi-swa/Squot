tests
testAdditionAndAdditionFormMerge
	| base working incoming merge expected |
	SquotToggles useNewApi ifTrue:
		[| artifactA valueHolder |
		base := SquotWorkingCopy2 new.
		working := base copy.
		working
			putArtifact: (artifactA := SquotArtifact storeInfo: (SquotTrackedObjectMetadata withNewIdValueHeldAtPath: 'a'));
			yourself.
		valueHolder := ValueHolder new contents: 1; yourself.
		(working storeForArtifact: artifactA) contents: valueHolder. "Avoid start object replacement with 1 and 2 because the older diffing implementation does not deal well with it."
		incoming := working copy.
		(incoming storeForArtifact: artifactA) contents: valueHolder copy.
		(incoming storeForArtifact: artifactA) contents contents: 2.
		"when"
		merge := SquotProjectMergeFactory new merge: (SquotProjectSnapshot fromStore: incoming) into: (SquotProjectSnapshot fromStore: working) basedOn: (SquotProjectSnapshot fromStore: base).
		"then"
		self assert: (merge elementMerges includesKey: artifactA id).
		^ self].
	base := SquotSnapshot empty.
	working := SquotSnapshot builder
		add: (SquotArtifactMock new path: 'a');
		buildSnapshot.
	incoming := SquotSnapshot builder
		add: (SquotArtifactMock new path: 'a');
		buildSnapshot.
	(working artifactAt: 'a') whenMergeWith: (incoming artifactAt: 'a')
		return: [expected := SquotArtifactMerge new
					working: (working artifactAt: 'a');
					graphMerge: (SquotGraphMergeMock new hasChanges: true)].
	"when"
	merge := SquotMerge into: working merge: incoming basedOn: base.
	"then"
	self assert: (merge at: 'a') == expected.