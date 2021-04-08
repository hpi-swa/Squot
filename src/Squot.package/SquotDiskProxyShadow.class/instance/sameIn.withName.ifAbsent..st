accessing
sameIn: aShadowGraph withName: aName ifAbsent: aBlock
	^ aShadowGraph shadowNamed: aName ifAbsent: [aBlock value]