as yet unclassified
addToGraph: aShadow
	aShadow hasSquotShadowName ifFalse: [^ aShadow].
	patchedObjectGraph assign: aShadow name toShadow: aShadow undecorated.
	^ aShadow