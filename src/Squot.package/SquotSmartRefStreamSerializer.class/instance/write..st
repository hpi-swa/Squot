as yet unclassified
write: anArtifact
	(rootDirectory resolve: anArtifact path) writeStreamDo: [:stream |
		(self streamClass on: stream)
			nextPutObjOnly: anArtifact content]