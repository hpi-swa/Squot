private
atPathOf: anArtifact writeStreamDo: aBlock
	^ (self rootDirectory resolve: anArtifact path) writeStreamDo: aBlock