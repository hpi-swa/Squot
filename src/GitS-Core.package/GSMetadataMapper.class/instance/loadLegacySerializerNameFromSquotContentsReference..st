metadata-loading-legacy
loadLegacySerializerNameFromSquotContentsReference: aReference
	| metadata |
	aReference isFile ifFalse: [^ nil].
	metadata := aReference readStreamDo: [:stream | self stonFromStream: stream].
	^ (metadata at: #serializer ifAbsent: [^ nil]) asSymbol