tests
testCorrectLoadOrderAfterExcludedArtifactRemovalAndSimultaneousOrderChange
	| builder editedPatch original patched |
	original := SquotSnapshot builder
		add: (SquotArtifactMock new path: '1'; diffBlock: [SquotArtifactDiffMock path: '1']; yourself);
		add: (SquotArtifactMock new path: '2'; yourself);
		add: (SquotArtifactMock new path: '3'; diffBlock: [SquotArtifactDiffMock path: '3']; yourself);
		buildSnapshot.
	patched := SquotSnapshot builder
		add: (SquotArtifactMock new path: '3'; yourself);
		add: (SquotArtifactMock new path: '1'; yourself);
		buildSnapshot.
	builder := (patched patchRelativeToBase: original) createNewBuilder.
	builder resetAt: '2'.
	editedPatch := builder buildPatch.
	self assert: #('3' '1' '2') equals: editedPatch patchedLoadOrder.