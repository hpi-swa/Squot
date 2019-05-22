Squot deserialization
fillContentOf: anArtifact from: aDirectory
	| packageName snapshot reader |
	packageName := aDirectory basename.
	reader := TonelReader on: aDirectory parent fileName: packageName.
	snapshot := reader snapshot.
	anArtifact content:
		(SquotShadowGraph withSingleShadow:
			(SquotPackageShadow forPackageNamed: packageName withSnapshot: snapshot))