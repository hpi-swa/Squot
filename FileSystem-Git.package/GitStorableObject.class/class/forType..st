initialize-release
forType: aString
	| errorBlock |
	errorBlock := [ GitInvalidObjectError signal: 'Could not load object. Invalid type code: ', 
		aString printString ].
	
	aString isEmptyOrNil ifTrue: errorBlock.
	^ self types
		detect: [ :class | class typeCode = aString ]
		ifNone: errorBlock