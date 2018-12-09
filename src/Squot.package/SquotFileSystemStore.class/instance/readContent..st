private
readContent: aSquotArtifact
	| fileOrDirectory deserializer |
	fileOrDirectory := self resolve: aSquotArtifact path.
	deserializer := self deserializers detect: [:each |
		each canReadObjectSerializedBy:
			(aSquotArtifact storeInfo
				at: #serializer
				ifAbsent: [(self guessSerializerForArtifact: aSquotArtifact in: fileOrDirectory)
							ifNil: [(SquotCannotFindSerializer for: fileOrDirectory) signal]])].
	deserializer new fillContentOf: aSquotArtifact from: fileOrDirectory.