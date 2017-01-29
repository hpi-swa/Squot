Squot deserialization
fillContentOf: anArtifact from: aFileReference
	aFileReference readStreamDo: [:stream |
		anArtifact content: (self streamClass on: stream) next]