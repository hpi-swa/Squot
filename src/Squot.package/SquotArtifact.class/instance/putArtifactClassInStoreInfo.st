initialize-release
putArtifactClassInStoreInfo
	"To allow stores to accurately reproduce artifacts, put my class name in the metadata"
	self class ~~ SquotArtifact
		ifTrue: [self storeInfo at: #artifactClassName put: self class name].