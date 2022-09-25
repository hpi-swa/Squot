tests
testUnloaded
	| snapshot |
	snapshot := self capturePackage.
	self untrackPackage;
		unloadPackage;
		updatePackage: snapshot;
		checkRestoredPackage.