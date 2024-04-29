importing
serializerFromSquotContents: aPath in: aFilesystem fallback: aSymbol
	| serializerName |
	serializerName := self serializerNameFromSquotContents: aPath in: aFilesystem.
	serializerName ifNil: [
		self inform:
			('Warning: failed to read serializer name from {1} referenced in .squot. Assuming serializer {2}, as named in .squot.'
				format: {SquotPathUtilities asString: aPath. aSymbol}).
		serializerName := aSymbol].
	^ Environment current valueOf: serializerName