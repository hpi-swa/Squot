accessing
sameIn: anObjectGraph withName: aName ifAbsent: aBlock
	self assert: name = aName description: 'Object looked up with a different name'.
	^ decoratedObject sameIn: anObjectGraph withName: aName ifAbsent: aBlock