tests
testAdditionAndAdditionFormMerge
	| base working incoming merge expected |
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