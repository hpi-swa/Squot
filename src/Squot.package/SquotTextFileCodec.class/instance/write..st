Squot serialization
write: anArtifact
	self atPathOf: anArtifact writeStreamDo: [:stream | stream nextPutAll: anArtifact content].