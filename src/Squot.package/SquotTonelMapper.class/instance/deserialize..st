mapper-interface
deserialize: aFileSystem
	^ SquotDeserializedPackage version:
		(TonelReader
			on: (aFileSystem referenceTo: self path)
			fileName: self package name)
			version