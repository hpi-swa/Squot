private metadata access
metadataFor: anArtifact
	^ SquotObjectMetadataFile forObjectAt: (directory resolve: anArtifact path)