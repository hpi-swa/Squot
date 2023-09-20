requests
request: aString initialAnswer: aPath
	| path |
	path := UIManager default
				request: aString
				initialAnswer: (self asString: aPath).
	path isEmptyOrNil ifTrue: [^ nil].
	^ self fromString: path