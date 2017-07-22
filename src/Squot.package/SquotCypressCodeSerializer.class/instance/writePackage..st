private
writePackage: anArtifact
	self initializeFileTreeWritersInPackageDirectory: (rootDirectory resolve: anArtifact path).
	anArtifact shadowOfTrackedObject squotWrite: anArtifact with: self.