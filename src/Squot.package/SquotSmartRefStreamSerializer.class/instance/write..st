Squot serialization
write: anArtifact
	self atPathOf: anArtifact writeStreamDo:
		[:stream | (self streamClass on: stream) nextPutObjOnly: anArtifact content]