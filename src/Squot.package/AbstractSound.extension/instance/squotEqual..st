*Squot-Mapper-comparing
squotEqual: anObject
	self == anObject ifTrue: [^ true].
	(anObject isKindOf: AbstractSound) ifFalse: [^ false].
	self duration = anObject duration ifFalse: [^ false].
	^ self samples = anObject samples