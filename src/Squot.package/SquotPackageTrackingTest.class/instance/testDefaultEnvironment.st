tests
testDefaultEnvironment
	| artifact metadata expectedEnvironment |
	artifact := SquotLiveArtifact new.
	metadata := SquotTrackedObjectMetadata new.
	artifact storeInfo: metadata.
	expectedEnvironment := Environment current.
	self assert: expectedEnvironment == (PackageInfo squotEnvironmentInMetadata: metadata);
		assert: expectedEnvironment == (PackageInfo squotEnvironmentOf: artifact).
	expectedEnvironment := Environment new.
	expectedEnvironment beCurrentDuring: [
		self assert: expectedEnvironment == (PackageInfo squotEnvironmentInMetadata: metadata);
			assert: expectedEnvironment == (PackageInfo squotEnvironmentOf: artifact)].