converting
asSquotVersionIn: aRepository
	aRepository = repository ifTrue: [^ self baseVersion].
	^ self baseVersion asSquotVersionIn: aRepository