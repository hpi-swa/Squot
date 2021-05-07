serializing
squotWrite: anArtifact asTonelWith: aSerializer
	^ aSerializer
		writeMCSnapshot: snapshot
		forPackageNamed: packageName
		packageProperties: tonelProperties
		from: anArtifact