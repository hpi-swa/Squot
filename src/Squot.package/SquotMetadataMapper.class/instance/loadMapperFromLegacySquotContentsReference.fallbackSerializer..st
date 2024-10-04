metadata-loading-legacy
loadMapperFromLegacySquotContentsReference: aReference fallbackSerializer: aSymbol
	| serializer mapper |
	serializer := self loadLegacySerializerFromSquotContentsReference: aReference fallback: aSymbol.
	mapper := serializer asMapperFromReference: aReference.
	mapper ifNil: [self inform:
					('Warning: skipping unsupported serializer {1} at {2}.'
						format: {serializer name. SquotPathUtilities asString: aReference path})].
	^ mapper