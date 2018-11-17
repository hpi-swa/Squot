private
atPathOf: anArtifact writeStreamDo: aBlock
	
	self halt.
	"This writes a file shadow to the git system."
	^ (self rootDirectory resolve: anArtifact path) writeStreamDo: aBlock