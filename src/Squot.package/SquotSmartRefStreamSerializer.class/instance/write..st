Squot serialization
write: anArtifact
	self atPathOf: anArtifact writeStreamDo:
		[:artifactStream | anArtifact writeWith: self]