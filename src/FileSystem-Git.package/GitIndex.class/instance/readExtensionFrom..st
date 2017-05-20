as yet unclassified
readExtensionFrom: aStream
	extensions add: (GitIndexExtension readFrom: aStream indexVersion: version).