private
readContent: aSquotArtifact
	| fileOrDirectory deserializer |
	fileOrDirectory := self resolve: aSquotArtifact path.
	deserializer := self deserializers detect: [:each |
		each canReadObjectSerializedBy: (aSquotArtifact storeInfo at: #serializer)].
	deserializer new fillContentOf: aSquotArtifact from: fileOrDirectory.