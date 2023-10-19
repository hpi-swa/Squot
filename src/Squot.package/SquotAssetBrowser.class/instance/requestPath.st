requests
requestPath
	| path |
	[path := SquotPathUtilities
		requestAbsolute: 'Path:'
		initialAnswer: self initialPathRequestAnswer.
	path isNil or: [self isValidPath: path]] whileFalse: [
		self inform: ('The path ''{1}'' is already taken, please pick another.'
						format: {SquotPathUtilities asString: path})].
	^ path