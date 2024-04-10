importing
importSquotContents: aPath from: aFilesystem
	| readStream mapper metadata serializer |
	readStream := [aFilesystem readStreamOn: aPath]
						on: FileDoesNotExist
						do: [^ self inform:
								('Warning: missing {1} referenced in .squot'
									format: {SquotPathUtilities asString: aPath})].
	metadata := STON fromStream: readStream.
	serializer := Environment current valueOf: metadata serializer asSymbol.
	mapper := serializer asMapperIn: aFilesystem at: aPath.
	mapper ifNil: [^ self inform:
						('Warning: skipping unsupported serializer {1} at {2}.'
							format: {serializer name. SquotPathUtilities asString: aPath})].
	self addMapper: mapper.