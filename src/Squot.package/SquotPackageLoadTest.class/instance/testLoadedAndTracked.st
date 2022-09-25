tests
testLoadedAndTracked
	| snapshot |
	snapshot := self capturePackage.
	self updatePackage: snapshot.
	self checkRestoredPackage.