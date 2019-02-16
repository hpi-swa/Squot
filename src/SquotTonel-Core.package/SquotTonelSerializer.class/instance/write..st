Squot serialization
write: anArtifact
	self assert: anArtifact storeInfo objectClassName = 'PackageInfo'.
	directory := rootDirectory resolve: anArtifact path.
	anArtifact shadowOfTrackedObject squotWrite: anArtifact with: self.