Squot-diff-manipulation
copyWithPatch: aMCPatchOrMCMergeDiff
	^ self copy
		packageName: packageName patch: aMCPatchOrMCMergeDiff;
		yourself
	