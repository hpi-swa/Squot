tests
applyDiffToWorkingCopy: anArtifactDiff
	workingCopy
		applyPatch:
			(workingCopy newPatchBuilder
				addDiff: anArtifactDiff;
				buildPatch).