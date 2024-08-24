importing
serializerNameFromSquotContents: aPath in: aFilesystem
	| reference metadata |
	reference := aFilesystem referenceTo: aPath.
	reference exists ifFalse: [^ nil].
	metadata := reference readStreamDo: [:stream | STON fromStream: stream].
	^ (metadata at: #serializer ifAbsent: [^ nil]) asSymbol