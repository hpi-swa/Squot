requests
requestPathWithSuffix: aStringOrPath title: aString
	| path |
	path := self initialPathRequestAnswerWithSuffix: aStringOrPath.
	[path := SquotPathUtilities
		request: aString
		initialAnswer: path.
	path isNil or: [self isValidPath: path]] whileFalse: [
		self inform: ('The path ''{1}'' is already taken, please pick another.'
						format: {SquotPathUtilities asString: path})].
	^ path