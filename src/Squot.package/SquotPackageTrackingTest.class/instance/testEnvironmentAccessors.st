tests
testEnvironmentAccessors
	| artifact metadata environment |
	artifact := SquotLiveArtifact new.
	metadata := SquotTrackedObjectMetadata new.
	artifact storeInfo: metadata.
	environment := Object new.
	PackageInfo squotSetEnvironmentOf: artifact to: environment.
	self assert: environment == (PackageInfo squotEnvironmentOf: artifact).
	self assert: environment == (PackageInfo squotEnvironmentInMetadata: metadata).
	environment := Object new.
	PackageInfo squotSetEnvironment: environment inMetadata: metadata.
	self assert: environment == (PackageInfo squotEnvironmentInMetadata: metadata).
	self assert: environment == (PackageInfo squotEnvironmentOf: artifact).