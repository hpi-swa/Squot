importing
importSquotContents: aPath from: aFilesystem fallbackSerializer: aSymbol
	| serializer mapper |
	serializer := self serializerFromSquotContents: aPath in: aFilesystem fallback: aSymbol.
	mapper := serializer asMapperIn: aFilesystem at: aPath.
	mapper ifNil: [^ self inform:
						('Warning: skipping unsupported serializer {1} at {2}.'
							format: {serializer name. SquotPathUtilities asString: aPath})].
	self addMapper: mapper.