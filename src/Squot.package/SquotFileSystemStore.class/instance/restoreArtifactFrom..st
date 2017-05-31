private
restoreArtifactFrom: aFileOrDirectory
	| artifact artifactClass metadata deserializer |
	aFileOrDirectory exists ifFalse: [^ SquotAbsentArtifact at: (self pathOf: aFileOrDirectory)].
	metadata := self metadataForObjectAt: aFileOrDirectory.
	metadata isPresent ifFalse: [(SquotNoMetadataFileFound for: aFileOrDirectory) signal].
	artifactClass := metadata artifactClass.
	artifact := artifactClass new.
	artifact path: (self pathOf: aFileOrDirectory).
	metadata applyTo: artifact.
	deserializer := self deserializers detect: [:each |
		each canReadObjectSerializedBy:
			(artifact storeInfo at: #serializer
				ifAbsent: [(self guessSerializerForArtifact: artifact in: aFileOrDirectory)
						ifNil: [(SquotCannotFindSerializer for: aFileOrDirectory) signal]])].
	deserializer new fillContentOf: artifact from: aFileOrDirectory.
	^ artifact