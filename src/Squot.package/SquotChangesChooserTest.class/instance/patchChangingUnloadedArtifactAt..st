test objects
patchChangingUnloadedArtifactAt: path
	| artifact changed |
	artifact := SquotArtifactMock path: path.
	changed := artifact copy.
	artifact whenContentComparedWith: changed return: [SquotArtifactContentDiffMock new].
	^ ((SquotToggles useNewApi ifTrue: [SquotWorkingCopy2] ifFalse: [SquotWorkingCopy]) forTestInMemory
		addUnloaded: artifact;
		newPatchBuilder)
			addDiff: (SquotArtifactModification left: artifact right: changed
				"Note: not sending setLoadedInWorkingCopy!");
			updateRightArtifacts;
			buildPatch