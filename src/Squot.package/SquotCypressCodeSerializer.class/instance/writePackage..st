private
writePackage: anArtifact
	self initializeFileTreeWritersInPackageDirectory: (rootDirectory resolve: anArtifact path).
	fileTreeWriter writeVersionInfo: self rollingVersionInfo.
	fileTreeWriter writePackage: (MCPackage named: self packageNameFromPackageDirectory).
	anArtifact shadowOfTrackedObject squotWrite: anArtifact with: self.