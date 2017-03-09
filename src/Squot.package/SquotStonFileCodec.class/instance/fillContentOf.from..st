Squot deserialization
fillContentOf: anArtifact from: aFileOrDirectoryReference
	anArtifact content: (aFileOrDirectoryReference readStreamDo:
			                   [:stream | STON fromStream: stream])