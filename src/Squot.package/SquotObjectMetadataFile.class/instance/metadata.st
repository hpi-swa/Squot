accessing
metadata
	^ metadata ifNil:
		[metadata := metadataFile
			readStreamDo: [:stream |
				(STON reader on: stream; allowComplexMapKeys: true) next
					asSquotTrackedObjectMetadata]
			ifAbsent: [^ SquotTrackedObjectMetadata new].
		metadata]