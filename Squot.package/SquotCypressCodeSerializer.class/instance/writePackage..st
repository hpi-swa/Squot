private
writePackage: anArtifact
	self initializeFileTreeWritersInPackageDirectory: (rootDirectory resolve: anArtifact path).
	anArtifact writeWith: self.