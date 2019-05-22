private
findDeserializerFor: anArtifact in: aFileOrDirectory
	^ self deserializers detect: [:each |
		each canReadObjectSerializedBy:
			(anArtifact storeInfo serializer
				ifNil: [(self guessSerializerForArtifact: anArtifact in: aFileOrDirectory)
						ifNil: [(SquotCannotFindSerializer for: aFileOrDirectory) signal]])]