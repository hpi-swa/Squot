paths
requestUnmappedPathWithTitle: aString initialAnswer: aPath
	| path |
	path := aPath.
	[path := SquotPathUtilities
			request: aString
			initialAnswer: path.
	path isNil or: [self isUnmappedPath: path]] whileFalse: [
		self inform: ('The path ''{1}'' is already taken, please pick another.'
						format: {SquotPathUtilities asString: path})].
	^ path