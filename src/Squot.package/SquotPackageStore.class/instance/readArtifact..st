accessing artifacts
readArtifact: anArtifact
	| packageInfo graph |
	packageInfo := self packageInfoFor: anArtifact.
	graph := (SquotObjectCapturer new
		registry: SquotObjectRegistry new;
		captureGraph: packageInfo;
		objectGraph) asShadowGraph.
	^ SquotArtifactSnapshot artifact: anArtifact objectSnapshot: graph