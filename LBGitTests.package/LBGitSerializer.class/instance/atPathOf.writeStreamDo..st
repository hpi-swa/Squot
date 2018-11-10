private
atPathOf: anArtifact writeStreamDo: aBlock
	
	self halt.
	^ (self rootDirectory resolve: anArtifact path) writeStreamDo: aBlock