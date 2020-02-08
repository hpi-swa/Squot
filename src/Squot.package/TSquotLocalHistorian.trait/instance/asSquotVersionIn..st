converting
asSquotVersionIn: aRepository
	aRepository = self repository ifTrue: [^ self version].
	^ (aRepository historianNamed: self name) version