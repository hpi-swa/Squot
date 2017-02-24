writing
updateFrom: anArtifact
	metadataFile writeStreamDo: [:stream |
		STON squotPut: anArtifact storeInfo onStream: stream].