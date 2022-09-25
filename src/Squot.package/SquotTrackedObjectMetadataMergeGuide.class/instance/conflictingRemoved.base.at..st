callbacks
conflictingRemoved: workingTargetReflection base: baseTargetReflection at: pathCollection
	pathCollection = pathToArtifactId ifTrue: [^ self].
	conflicts at: pathCollection put:
		(SquotObjectReferenceConflict key: pathCollection last
			base: baseTargetReflection object working: workingTargetReflection object incoming: nil).