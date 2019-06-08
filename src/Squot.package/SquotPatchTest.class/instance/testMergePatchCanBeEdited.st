tests
testMergePatchCanBeEdited
	"A Patch created by the MergePatchBuilder can later be edited further"
	| builder patch |
	builder := SquotMergePatchBuilder new.
	patch := builder
		patchFrom: (SquotSnapshot builder
						add: (SquotArtifactMock new
								path: 'something';
								diffBlock: [:other | SquotArtifactDiffMock new
													path: 'something';
													hasChanges: true;
													yourself];
								yourself);
						buildSnapshot)
		to: (SquotSnapshot builder
				add: (SquotArtifactMock new
						path: 'something';
						diffBlock: [:other | SquotArtifactDiffMock new
											path: 'something';
											hasChanges: true;
											yourself];
						yourself);
				buildSnapshot)
		base: SquotSnapshot empty.
	"when"
	patch createNewBuilder.
	"shouldn't raise"