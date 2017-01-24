private
deserializerForObjectAt: aFSReference
	| serializerName deserializer |
	serializerName := (self metadataForObjectAt: aFSReference) serializerName.
	deserializer := self deserializers detect: [:each | each canReadObjectSerializedBy: serializerName].
	^ deserializer new