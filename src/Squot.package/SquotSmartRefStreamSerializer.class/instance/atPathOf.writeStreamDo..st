private
atPathOf: anArtifact writeStreamDo: aBlock
	^ (self rootDirectory resolve: anArtifact path) writeStreamDo:
		[:aStream | stream := self streamClass on: aStream.
		aBlock value: aStream]