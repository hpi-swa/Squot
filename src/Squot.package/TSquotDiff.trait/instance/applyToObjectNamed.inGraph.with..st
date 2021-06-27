Squot-diff-patching
applyToObjectNamed: name inGraph: anObjectGraph with: aPatcher
	SquotToggles useNewObjectPatching ifTrue: [self isThisEverCalled].
	^ aPatcher
		apply: self
		toLoaded: (anObjectGraph
			objectNamed: name
			ifAbsent: [self error: 'Diff for a non-existing object, ',
				'diff does not fit the target graph'])