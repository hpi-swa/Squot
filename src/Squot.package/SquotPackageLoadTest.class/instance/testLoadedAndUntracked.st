tests
testLoadedAndUntracked
	| snapshot |
	snapshot := self capturePackage.
	self untrackPackage;
		updatePackage: snapshot;
		checkRestoredPackage.