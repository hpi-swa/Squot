comparing
= anObject
	anObject == self ifTrue: [^ true].
	(anObject respondsTo: #capture) ifFalse: [^ false].
	^ path = anObject path
		and: [(SquotToggles useNewApi ifTrue: [true] ifFalse: [self content = anObject content])
		and: [self storeInfo = anObject storeInfo]]