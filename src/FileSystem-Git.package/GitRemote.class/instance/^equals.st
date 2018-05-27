comparing
= anObject
	anObject species == self species ifFalse: [^ false].
	^ anObject name = self name
		and: [anObject url = self url]