private
restoreArtifactFrom: aFileOrDirectory
	| artifact artifactClass metadata deserializer |
	metadata := self metadataForObjectAt: aFileOrDirectory.
	artifactClass := metadata artifactClass.
	artifact := artifactClass new.
	artifact path: (self pathOf: aFileOrDirectory).
	metadata applyTo: artifact.
	deserializer := self deserializers detect: [:each |
		each canReadObjectSerializedBy: (artifact storeInfo at: #serializer)].
	deserializer new fillContentOf: artifact from: aFileOrDirectory.
	^ artifact