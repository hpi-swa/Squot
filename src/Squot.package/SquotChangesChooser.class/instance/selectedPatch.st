results
selectedPatch
	self accepted ifFalse: [^ self error: 'Should not ask for patch if selection was aborted'].
	^ editedPatch
		updateRightArtifacts;
		buildPatch