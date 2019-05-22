private
readMetadata: anArtifact
	| fileOrDirectory metadata |
	fileOrDirectory := self resolve: anArtifact path.
	metadata := self metadataForObjectAt: fileOrDirectory.
	metadata isPresent
		ifTrue: [metadata applyTo: anArtifact]
		ifFalse: [self guessMetadataForArtifact: anArtifact at: fileOrDirectory].
	^ anArtifact storeInfo