mapper-interface
serialize: fileSystem
	TonelWriter fileOut: self version on: (fileSystem referenceTo: self path).