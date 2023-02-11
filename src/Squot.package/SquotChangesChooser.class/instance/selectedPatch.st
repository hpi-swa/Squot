results
selectedPatch
	self accepted ifFalse: [^ self error: 'Should not ask for patch if selection was aborted'].
	SquotToggles useNewApi ifTrue: [^ editedPatch "a SquotProjectMerge"].
	^ editedPatch
		updateRightArtifacts;
		buildPatch