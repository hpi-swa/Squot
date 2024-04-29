importing
serializerNameFromSquotContents: aPath in: aFilesystem
	| readStream metadata |
	readStream := [aFilesystem readStreamOn: aPath] on: FileDoesNotExist do: [^ nil].
	metadata := STON fromStream: readStream.
	^ (metadata at: #serializer ifAbsent: [^ nil]) asSymbol