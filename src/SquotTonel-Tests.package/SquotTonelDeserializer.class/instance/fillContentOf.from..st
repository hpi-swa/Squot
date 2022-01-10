Squot deserialization
fillContentOf: anArtifact from: aDirectory
	| packageName snapshot packageShadow reader |
	packageName := aDirectory basename.
	reader := TonelReader on: aDirectory parent fileName: packageName.
	snapshot := reader snapshot.
	packageShadow := SquotPackageShadow
		forPackageNamed: packageName
		withSnapshot: snapshot
		tonelProperties: reader currentPackageProperties.
	anArtifact content: (SquotShadowGraph withSingleShadow: packageShadow).