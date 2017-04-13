accessing
metadata
	^ metadata ifNil:
		[metadata := metadataFile readStreamDo: [:stream | STON fromStream: stream]
			ifAbsent: [^ Dictionary new]]