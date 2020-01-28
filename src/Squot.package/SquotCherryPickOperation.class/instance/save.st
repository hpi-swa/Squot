applying
save
	"Save the new version."
	^ self saveOperation
		patch: loadedPatch;
		applyToWorkingCopy