tests
patchWithLoadOrderChange
	| patch |
	patch := SquotPatch builder
		startingFrom: (SquotSnapshot builder
							add: (SquotArtifact new path: '1');
							add: (SquotArtifact new path: '2');
							buildSnapshot);
		addDiff: (SquotArtifactDiffMock path: '1');
		addDiff: (SquotArtifactDiffMock path: '2');
		newLoadOrder: #('2' '1');
		buildPatch.
	self assert: patch diffs size = 2;
		assert: (patch loadOrderDiff applyTo: #('1' '2')) = #('2' '1').
	^ patch