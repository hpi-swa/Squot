paths
requestUnmappedPathWithTitle: aString initialAnswer: aPath additionalOptions: aCollection
	| path |
	path := SquotPathUtilities
				requestAbsolute: aString
				initialAnswer: aPath.
	path ifNil: [^ nil].
	^ self
		getUnmappedPathFrom: path
		withTitle: aString
		additionalOptions: aCollection