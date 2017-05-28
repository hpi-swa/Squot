private
readMetadata: anArtifact
	| fileOrDirectory metadata |
	fileOrDirectory := self resolve: anArtifact path.
	metadata := self metadataForObjectAt: fileOrDirectory.
	metadata isPresent ifFalse: [(SquotNoMetadataFileFound for: fileOrDirectory) signal].
	metadata applyTo: anArtifact.