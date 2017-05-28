comparing
= anObject
	self species = anObject species ifFalse: [^ false].
	^ path = anObject path
		and: [self content = anObject content
		and: [self storeInfo = anObject storeInfo]]