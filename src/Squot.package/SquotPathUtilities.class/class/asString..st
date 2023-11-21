converting
asString: aPath
	aPath ifNil: [^ ''].
	aPath isString ifTrue: [^ aPath].
	^ String streamContents: [:stream |
		stream nextPut: self mainDelimiter. "always absolute"
		aPath printOn: stream delimiter: self mainDelimiter]