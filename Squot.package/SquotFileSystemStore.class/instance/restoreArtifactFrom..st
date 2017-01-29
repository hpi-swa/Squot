private
restoreArtifactFrom: aFileOrDirectory
	| artifact metadata deserializer serializerName |
	artifact := SquotArtifact new.
	artifact path: (self pathOf: aFileOrDirectory).
	metadata := self metadataForObjectAt: aFileOrDirectory.
	self flag: #featureEnvy.
	artifact storeInfo at: #objectClassName put: metadata objectClassName.
	artifact storeInfo at: #serializer put: (serializerName := metadata serializerName).
	deserializer := self deserializers detect: [:each | each canReadObjectSerializedBy: serializerName].
	deserializer new fillContentOf: artifact from: aFileOrDirectory.
	^ artifact