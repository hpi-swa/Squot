*Squot-Mapper-comparing
squotEqual: anObject
	self == anObject ifTrue: [^ true].
	anObject isForm ifFalse: [^ false].
	self extent = anObject extent ifFalse: [^ false].
	self depth = anObject depth ifFalse: [^ false].
	^ self bits = anObject bits