callbacks
removed: workingTargetReflection at: pathCollection
	pathCollection = pathToArtifactId ifTrue: [^ self].
	diffs at: pathCollection put:
		(SquotReferenceRemoval of: workingTargetReflection object
			from: currentWorking object
			reference: pathCollection last
			rightObject: currentIncoming object).