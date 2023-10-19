requests
requestPathFor: anAssetMapperClass
	| path |
	[path := SquotPathUtilities
		request: 'Path:'
		initialAnswer: (self initialPathRequestAnswerFor: anAssetMapperClass).
	path isNil or: [self isValidPath: path]] whileFalse: [
		self inform: ('The path ''{1}'' is already taken, please pick another.'
						format: {SquotPathUtilities asString: path})].
	^ path