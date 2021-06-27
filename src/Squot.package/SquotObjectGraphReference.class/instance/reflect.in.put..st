reflection
reflect: aGraph in: aMirror put: newValue
	"Just register the object."
	| object |
	object := aGraph objectNamed: objectName ifAbsent: [].
	object
		ifNil: [aGraph assign: objectName to: newValue]
		ifNotNil: [self assert: object == newValue].
	^ newValue