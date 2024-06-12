comparing
= anObject
	self class = anObject class ifFalse: [^ false].
	self name = anObject name ifFalse: [^ false].
	self mappers asSet = anObject mappers asSet ifFalse: [^ false].
	^ true