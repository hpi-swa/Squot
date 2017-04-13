comparing
= anObject
	self species = anObject species ifFalse: [^ false].
	^ self repository = anObject repository
	and: [self expandedName = anObject expandedName]