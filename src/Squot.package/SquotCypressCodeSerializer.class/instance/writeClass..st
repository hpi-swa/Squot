private
writeClass: anArtifact
	"initialize writers in the parent (package) directory, because they operate on packages"
	self initializeFileTreeWritersInPackageDirectory: (rootDirectory resolve: anArtifact path) parent.
	anArtifact shadowOfTrackedObject squotWrite: anArtifact with: self.