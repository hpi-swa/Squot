converting
findOrCreateAndRematerialize: aShadow
	| existing |
	aShadow hasSquotShadowName ifTrue:
		[existing := objectRegistry objectNamed: aShadow name ifAbsent: [].
		(existing notNil and: [existing squotShouldKeepIdentity])
			ifTrue: [^ self materialize: aShadow in: existing]].
	^ aShadow squotMaterializeWith: self