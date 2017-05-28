Squot serialization
write: anArtifact
	self initialize.
	((anArtifact storeInfo at: #objectClassName ifAbsent: [#PackageInfo]) endsWith: ' class')
		ifTrue: [self writeClass: anArtifact]
		ifFalse: [self writePackage: anArtifact]