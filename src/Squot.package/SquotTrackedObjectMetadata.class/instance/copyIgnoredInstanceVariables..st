copying
copyIgnoredInstanceVariables: anIdentityDictionary
	SquotToggles useNewApi ifTrue: [self deprecated].
	^ anIdentityDictionary copy