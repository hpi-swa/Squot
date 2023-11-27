comparing
= anObject
	self == anObject ifTrue: [^ true].
	(anObject isKindOf: self class) ifFalse: [^ false].
	^ self gif = anObject gif