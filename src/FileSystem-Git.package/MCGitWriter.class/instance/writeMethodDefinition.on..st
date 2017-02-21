writing
writeMethodDefinition: aMethodDefinition on: aStream
	aStream nextPutAll: (self convert: (self serializeMethodDefinition: aMethodDefinition)).