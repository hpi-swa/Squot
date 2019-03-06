private
readMetadata: anArtifact
	| fileOrDirectory metadata |
	fileOrDirectory := self resolve: anArtifact path.
	metadata := self metadataForObjectAt: fileOrDirectory.
	metadata applyTo: anArtifact.
	^ anArtifact storeInfo