Squot serialization
write: anArtifact
	self atPathOf: anArtifact writeStreamDo:
		[:artifactStream |
			stream := self streamClass on: artifactStream.
			anArtifact writeWith: self]