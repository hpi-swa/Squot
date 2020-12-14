writing
updateFrom: aTrackedObjectMetadata
	metadata := aTrackedObjectMetadata.
	metadataFile writeStreamDo: [:stream | STON squotPut: metadata onStream: stream].