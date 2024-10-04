metadata-loading-legacy
loadLegacySerializerFromSquotContentsReference: aReference fallback: aSymbol
	| serializerName |
	serializerName := self loadLegacySerializerNameFromSquotContentsReference: aReference.
	serializerName ifNil: [
		self inform:
			('Warning: failed to read serializer name from {1}
			referenced in {2}. Assuming serializer {3}, as named in {2}.'
				withoutLineEndings withBlanksCondensed
				format: {
					SquotPathUtilities asString: aReference path.
					SquotPathUtilities asString: self legacySquotFilePath.
					aSymbol}).
		serializerName := aSymbol].
	^ Environment current valueOf: serializerName