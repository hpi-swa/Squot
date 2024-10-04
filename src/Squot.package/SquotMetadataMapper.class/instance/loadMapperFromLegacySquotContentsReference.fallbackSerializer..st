metadata-loading-legacy
loadMapperFromLegacySquotContentsReference: aReference fallbackSerializer: aSymbol
	| serializerName mapperClass |
	serializerName := (self loadLegacySerializerNameFromSquotContentsReference: aReference) ifNil: [aSymbol].
	mapperClass := serializerName caseOf: {
		[#SquotTonelSerializer] -> [SquotTonelMapper].
		[#SquotCypressCodeSerializer] -> [SquotCypressMapper].
	} otherwise: [
		self inform:
			('Warning: skipping unsupported serializer {1} at {2}.'
				format: {serializerName. SquotPathUtilities asString: aReference path}).
		^ nil].
	^ mapperClass fromLegacySquotContentsReference: aReference