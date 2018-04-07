adding
ifNecessaryAssignNameToShadow: aShadow
	aShadow hasSquotShadowName ifTrue: [^ self].
	self
		assign: (SquotActiveObjectRegistry value
				ifNotNil: [SquotActiveObjectRegistry nameOf: aShadow
						ifAbsent: [self class anonymousObjectName]]
				ifNil: [self class anonymousObjectName])
		toShadow: aShadow.