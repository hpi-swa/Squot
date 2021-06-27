converting
findOrCreateAndRematerialize: aShadow
	| existing |
	SquotToggles useNewObjectPatching ifTrue: [self deprecated].
	self sourceNameOf: aShadow ifPresent: [:name |
		existing := objectRegistry objectNamed: name ifAbsent: [].
		(existing notNil and: [existing squotShouldKeepIdentity])
			ifTrue: [^ self materialize: aShadow in: existing]].
	^ aShadow squotMaterializeWith: self