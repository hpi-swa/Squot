metadata-loading-legacy
loadMapperFromLegacySquotContentsReference: aReference fallbackSerializer: aSymbol
	| serializerName mapperClass |
	serializerName := (self loadLegacySerializerNameFromSquotContentsReference: aReference) ifNil: [aSymbol].
	mapperClass := serializerName caseOf: {
		[#SquotTonelSerializer] -> [GSTonelMapper].
		[#SquotCypressCodeSerializer] -> [GSCypressMapper].
	} otherwise: [
		self inform:
			('Warning: skipping unsupported serializer {1} at {2}.'
				format: {serializerName. GSPathUtilities asString: aReference path}).
		^ nil].
	^ mapperClass fromLegacySquotContentsReference: aReference