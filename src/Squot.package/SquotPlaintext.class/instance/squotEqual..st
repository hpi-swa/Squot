as yet unclassified
squotEqual: aString
	self == aString ifTrue: [^ true].
	aString isString ifFalse: [^ false].
	^ self lines = aString lines