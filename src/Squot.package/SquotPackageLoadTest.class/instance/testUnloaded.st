testing
testUnloaded
	| snapshot |
	snapshot := self capturePackage.
	self untrackPackage;
		unloadPackage.
	imageStore applyPatch: (snapshot patchRelativeToBase: imageStore).
	self checkRestoredPackage.