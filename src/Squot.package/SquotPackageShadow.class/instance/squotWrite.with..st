serializing
squotWrite: anArtifact with: aSerializer
	^ aSerializer writeMCSnapshot: snapshot forPackageNamed: packageName from: anArtifact