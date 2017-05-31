patching
applyPatch: aPatch
	^ self createNewBuilder
		applyPatch: aPatch;
		buildSnapshot