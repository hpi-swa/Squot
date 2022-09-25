callbacks
changed: workingTargetReflection to: incomingTargetReflection at: pathCollection
	pathCollection = pathToArtifactId ifTrue: [^ self].
	diffs at: pathCollection put:
		(SquotReferenceTargetExchange reference: pathCollection last
			leftOwner: currentWorking object target: workingTargetReflection object
			rightOwner: currentIncoming object target: incomingTargetReflection object).