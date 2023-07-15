accessing
propertyAt: pathCollection put: anObject
	| current |
	current := self.
	pathCollection allButLastDo:
		[:each | current := current at: each].
	^ current at: pathCollection last put: anObject