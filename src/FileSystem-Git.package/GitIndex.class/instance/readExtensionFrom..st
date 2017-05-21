reading
readExtensionFrom: aStream
	extensions add: (GitIndexExtension readFrom: aStream indexVersion: version).