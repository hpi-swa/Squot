accessing
sameIn: anObjectShadow ifAbsent: aBlock
	"A shadow slot is an object reference."
	^ [self lookupIn: anObjectShadow]
		on: NotFound, KeyNotFound do: [:ex | ex return: aBlock value]