comparing
= anObject
	self species = anObject species ifFalse: [^ false].
	^ path = anObject path
		and: [content = anObject content
		and: [storeInfo = anObject storeInfo]]