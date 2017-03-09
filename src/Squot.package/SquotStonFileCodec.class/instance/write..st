Squot serialization
write: anArtifact
	self atPathOf: anArtifact writeStreamDo:
		[:stream | STON squotPut: anArtifact content onStream: stream]