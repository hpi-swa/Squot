*Squot-Mapper-comparing
squotEqual: aString
	| a b aHasNewLine bHasNewLine |
	self == aString ifTrue: [^ true].
	aString isString ifFalse: [^ false].
	a := self readStream.
	b := aString readStream.
	[[aHasNewLine := (a peekFor: Character cr) | (a peekFor: Character lf).
	bHasNewLine := (b peekFor: Character cr) | (b peekFor: Character lf).
	aHasNewLine = bHasNewLine ifFalse: [^ false].
	aHasNewLine] whileTrue.
	(a atEnd or: [b atEnd]) ifTrue: [^ a atEnd = b atEnd].
	a next = b next ifFalse: [^ false]] repeat.