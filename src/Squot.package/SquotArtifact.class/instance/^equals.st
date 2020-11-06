comparing
= anObject
	(anObject respondsTo: #capture) ifFalse: [^ false].
	^ path = anObject path
		and: [self content = anObject content
		and: [self storeInfo = anObject storeInfo]]