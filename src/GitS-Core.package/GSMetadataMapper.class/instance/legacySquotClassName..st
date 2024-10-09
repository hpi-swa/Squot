metadata-loading-legacy
legacySquotClassName: aClass
	self assert: (aClass name beginsWith: #GS).
	^ (#Squot, (aClass name allButFirst: #GS size)) asSymbol