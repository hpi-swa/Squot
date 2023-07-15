accessing
propertyAt: pathCollection
	| current |
	current := self.
	pathCollection do:
		[:each | current := current at: each].
	^ current