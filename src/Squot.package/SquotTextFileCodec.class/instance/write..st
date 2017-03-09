as yet unclassified
write: anArtifact
	self atPathOf: anArtifact writeStreamDo: [:stream | stream nextPutAll: anArtifact content].