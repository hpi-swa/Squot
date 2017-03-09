writing
updateFrom: anArtifact
	metadata := anArtifact storeInfo.
	metadataFile writeStreamDo: [:stream | STON squotPut: metadata onStream: stream].