comparing
= anObject
	self species = anObject species ifFalse: [^ false].
	^ gitRepository repository = anObject gitRepository repository