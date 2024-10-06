instance creation
withMapper: aMapper fromStream: aStream
	^ self withMapper: aMapper contents: (aStream binary; contents) asByteArray