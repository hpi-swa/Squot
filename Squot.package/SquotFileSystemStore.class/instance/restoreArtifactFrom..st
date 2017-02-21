private
restoreArtifactFrom: aFileOrDirectory
	| artifact metadata deserializer |
	artifact := SquotArtifact new.
	artifact path: (self pathOf: aFileOrDirectory).
	metadata := self metadataForObjectAt: aFileOrDirectory.
	metadata applyTo: artifact.
	deserializer := self deserializers detect: [:each |
		each canReadObjectSerializedBy: (artifact storeInfo at: #serializer)].
	deserializer new fillContentOf: artifact from: aFileOrDirectory.
	^ artifact