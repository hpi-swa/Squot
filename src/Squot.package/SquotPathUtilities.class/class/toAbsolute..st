requests
toAbsolute: aPath
	aPath ifNil: [^ aPath].
	^ FSPath root resolve: aPath