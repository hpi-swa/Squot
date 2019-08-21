accessing
startShadowReference
	^ SquotGeneralPurposeObjectReference
		get: [self startShadow]
		set: [:aShadow | self notYetImplemented]