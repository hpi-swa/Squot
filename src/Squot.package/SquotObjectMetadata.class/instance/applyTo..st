reading
applyTo: anArtifact
	| metadata |
	metadata := metadataFile readStreamDo: [:stream | STON fromStream: stream].
	anArtifact mergeStoreInfo: metadata.