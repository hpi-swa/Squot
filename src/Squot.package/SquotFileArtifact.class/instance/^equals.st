comparing
= anotherObject
	self species = anotherObject species
		ifFalse: [^ super = anotherObject].
	^ fileReference = anotherObject fileReference
	