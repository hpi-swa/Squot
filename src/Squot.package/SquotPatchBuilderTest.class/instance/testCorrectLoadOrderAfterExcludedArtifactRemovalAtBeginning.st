tests
testCorrectLoadOrderAfterExcludedArtifactRemovalAtBeginning
	| builder editedPatch original patched |
	original := SquotSnapshot builder
		add: (SquotArtifactMock new path: '1'; yourself);
		add: (SquotArtifactMock new path: '2'; diffBlock: [SquotArtifactDiffMock path: '2']; yourself);
		buildSnapshot.
	patched := SquotSnapshot builder
		add: (SquotArtifactMock new path: '2'; yourself);
		buildSnapshot.
	builder := (patched patchRelativeToBase: original) createNewBuilder.
	builder resetAt: '1'.
	editedPatch := builder updateRightArtifacts; buildPatch.
	self assert: #('1' '2') equals: editedPatch patchedLoadOrder.