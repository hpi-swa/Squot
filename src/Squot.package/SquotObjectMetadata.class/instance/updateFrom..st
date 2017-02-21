writing
updateFrom: anArtifact
	metadataFile writeStreamDo: [:stream |
		(STON writer on: stream)
			newLine: String lf;
			prettyPrint: true;
			nextPut: anArtifact storeInfo].