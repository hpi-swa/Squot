callbacks
changed: workingTargetReflection to: incomingTargetReflection at: pathCollection
	removals add: (SquotArtifactRemoval of: workingTargetReflection object).
	additions add: (SquotArtifactAddition of: incomingTargetReflection object).