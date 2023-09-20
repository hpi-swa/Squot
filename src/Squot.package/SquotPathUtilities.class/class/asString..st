converting
asString: aPath
	aPath ifNil: [^ ''].
	aPath isString ifTrue: [^ aPath].
	^ aPath asReference printString