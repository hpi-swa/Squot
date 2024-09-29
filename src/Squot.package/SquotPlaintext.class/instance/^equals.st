comparing
= anObject
	| a b aHasNewLine bHasNewLine |
	self == anObject ifTrue: [^ true].
	self class = anObject class ifFalse: [^ false].
	a := self readStream.
	b := anObject readStream.
	[[aHasNewLine := self peekForNewLine: a.
	bHasNewLine := self peekForNewLine: b.
	aHasNewLine = bHasNewLine ifFalse: [^ false].
	aHasNewLine] whileTrue.
	(a atEnd or: [b atEnd]) ifTrue: [^ a atEnd = b atEnd].
	a next = b next ifFalse: [^ false]] repeat.