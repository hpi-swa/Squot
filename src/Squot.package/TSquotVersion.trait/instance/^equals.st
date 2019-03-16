comparing
= anObject
	^ (anObject respondsTo: #internalId) and: [anObject internalId = self internalId]