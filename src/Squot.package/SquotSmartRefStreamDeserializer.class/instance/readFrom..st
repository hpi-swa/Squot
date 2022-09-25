Squot deserialization
readFrom: aFileReference
	^ aFileReference readStreamDo: [:stream |
		(self streamClass on: stream) next]