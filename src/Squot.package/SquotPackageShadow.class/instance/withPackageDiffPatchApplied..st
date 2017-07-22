patching
withPackageDiffPatchApplied: aMCPatchOrMCMergeDiff
	^ self copyWithSnapshot: (aMCPatchOrMCMergeDiff squotApplyTo: snapshot)