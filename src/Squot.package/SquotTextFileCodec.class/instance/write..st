Squot serialization
write: anArtifact
	self atPathOf: anArtifact writeStreamDo: [:stream |
		anArtifact content writeTo: stream.
		stream truncate].