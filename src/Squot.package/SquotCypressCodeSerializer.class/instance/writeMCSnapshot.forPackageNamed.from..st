Squot serialization
writeMCSnapshot: aMCSnapshot forPackageNamed: aString from: anArtifact
	^ aMCSnapshot squotWrite: anArtifact with: self