as yet unclassified
write: anArtifact

	self atPathOf: anArtifact writeStreamDo: [:stream | anArtifact shadowOfTrackedObject writeTo: stream].