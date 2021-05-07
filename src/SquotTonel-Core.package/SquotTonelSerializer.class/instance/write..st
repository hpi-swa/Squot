Squot serialization
write: anArtifact
	self assert: anArtifact storeInfo objectClassName = 'PackageInfo'.
	directory := rootDirectory resolve: anArtifact path.
	anArtifact shadowOfTrackedObject squotWrite: anArtifact asTonelWith: self.
	(directory parent / '.properties') writeStreamDo:
		[:stream |
		stream truncate; nextPutAll: self propertiesFileContents].