testing
testLoadedAndTracked
	| snapshot |
	snapshot := self capturePackage.
	imageStore applyPatch: (snapshot patchRelativeToBase: imageStore).
	self checkRestoredPackage.