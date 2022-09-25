callbacks
conflictingAdded: workingTargetReflection and: incomingTargetReflection at: pathCollection
	pathCollection = pathToArtifactId ifTrue: [^ self].
	conflicts at: pathCollection put:
		(SquotReferenceAdditionConflict reference: pathCollection last
			working: workingTargetReflection object owner: currentWorking
			incoming: incomingTargetReflection object owner: currentIncoming).