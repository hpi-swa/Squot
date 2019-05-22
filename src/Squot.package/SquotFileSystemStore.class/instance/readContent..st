private
readContent: aSquotArtifact
	| fileOrDirectory deserializer |
	fileOrDirectory := self resolve: aSquotArtifact path.
	deserializer := self findDeserializerFor: aSquotArtifact in: fileOrDirectory.
	deserializer new fillContentOf: aSquotArtifact from: fileOrDirectory.