callbacks
conflictingRemovedFromWorkingCopy: baseTargetReflection incoming: incomingTargetReflection at: pathCollection
	pathCollection = pathToArtifactId
		ifTrue: [^ self added: incomingTargetReflection at: pathCollection].
	conflicts at: pathCollection put:
		(SquotObjectReferenceConflict key: pathCollection last
			base: baseTargetReflection object working: nil incoming: incomingTargetReflection object).