comparing
= other
	self species = other species ifFalse: [^ false].
	^ string = other string