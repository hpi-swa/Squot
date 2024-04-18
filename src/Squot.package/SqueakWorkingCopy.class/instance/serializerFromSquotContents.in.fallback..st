importing
serializerFromSquotContents: aPath in: aFilesystem fallback: aSymbol
	| serializerName |
	serializerName := [ | readStream metadata |
		readStream := aFilesystem readStreamOn: aPath.
		metadata := STON fromStream: readStream.
		metadata serializer asSymbol]
			on: FileDoesNotExist do: [
				self inform:
					('Warning: missing {1} referenced in .squot. Assuming serializer {2}, as named in .squot.'
						format: {SquotPathUtilities asString: aPath. aSymbol}).
				aSymbol].
	^ Environment current valueOf: serializerName