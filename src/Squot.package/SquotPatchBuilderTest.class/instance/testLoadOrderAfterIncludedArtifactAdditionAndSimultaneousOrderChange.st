tests
testLoadOrderAfterIncludedArtifactAdditionAndSimultaneousOrderChange
	| editedPatch original patched |
	original := SquotSnapshot builder
		add: (SquotArtifactMock new path: '1'; diffBlock: [SquotArtifactDiffMock path: '1']; yourself);
		add: (SquotArtifactMock new path: '3'; diffBlock: [SquotArtifactDiffMock path: '3']; yourself);
		buildSnapshot.
	patched := SquotSnapshot builder
		add: (SquotArtifactMock new path: '3'; yourself);
		add: (SquotArtifactMock new path: '2'; yourself);
		add: (SquotArtifactMock new path: '1'; yourself);
		buildSnapshot.
	editedPatch := SquotPatchBuilder new patchFrom: original to: patched. 
	self assert: #('3' '2' '1') equals: (editedPatch loadOrderDiff applyTo: #('1' '3'));
		assert: #('3' '2' '1') equals: editedPatch patchedLoadOrder.