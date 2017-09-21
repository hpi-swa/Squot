adding
ifNecessaryAssignNameToShadow: aShadow
	aShadow hasSquotShadowName ifTrue: [^ self].
	self
		assign: (SquotActiveObjectRegistry value
				ifNotNil: [SquotActiveObjectRegistry nameOf: aShadow]
				ifNil: [self class anonymousObjectName])
		toShadow: aShadow.