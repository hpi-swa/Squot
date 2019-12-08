private storing
validatePath: path for: anArtifact
	^ (self serializerFactoryFor: anArtifact) rewritePath: path for: anArtifact content