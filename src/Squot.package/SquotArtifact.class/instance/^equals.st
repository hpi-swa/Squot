comparing
= anObject
	anObject == self ifTrue: [^ true].
	(anObject respondsTo: #capture) ifFalse: [^ false].
	^ path = anObject path
		and: [self content = anObject content
		and: [self storeInfo = anObject storeInfo]]