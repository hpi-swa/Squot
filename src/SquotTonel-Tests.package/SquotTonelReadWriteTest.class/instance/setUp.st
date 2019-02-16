running
setUp
	rootDirectory := FileSystem memory root.
	serializer := SquotTonelSerializer writingBelow: rootDirectory.
	deserializer := SquotTonelDeserializer new.