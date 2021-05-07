converting
asSquotVersionIn: aRepository
	aRepository = self repository ifTrue: [^ self].
	^ aRepository versionAt: self internalId