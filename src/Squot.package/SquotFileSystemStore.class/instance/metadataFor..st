private metadata access
metadataFor: anArtifact
	^ SquotObjectMetadata forObjectAt: (directory resolve: anArtifact path)