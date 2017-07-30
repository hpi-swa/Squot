testing
testLoadedAndUntracked
	| snapshot |
	snapshot := self capturePackage.
	self untrackPackage.
	imageStore applyPatch: (snapshot patchRelativeToBase: imageStore).
	self checkRestoredPackage.