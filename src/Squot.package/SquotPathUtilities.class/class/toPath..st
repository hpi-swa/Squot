converting
toPath: aStringOrPath
	^ aStringOrPath isString
		ifTrue: [self fromString: aStringOrPath]
		ifFalse: [aStringOrPath]