converting
toAbsolutePath: aStringOrPath
	aStringOrPath isString ifTrue: [^ self fromString: aStringOrPath].
	aStringOrPath isAbsolute ifTrue: [^ aStringOrPath].
	^ FSAbsolutePath withAll: aStringOrPath segments