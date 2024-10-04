metadata-loading-legacy
loadLegacySerializerNameFromSquotContentsReference: aReference
	| metadata |
	aReference exists ifFalse: [^ nil].
	metadata := aReference readStreamDo: [:stream | STON fromStream: stream].
	^ (metadata at: #serializer ifAbsent: [^ nil]) asSymbol