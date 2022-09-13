patching
applyDiff: aSquotArtifactModification toObjectAt: path
	| artifact |
	(store includesObjectAt: path)
		ifTrue: [artifact := SquotLoadedArtifact
				wrapping:
					(aSquotArtifactModification hasChanges
						ifTrue: [store applyDiff: aSquotArtifactModification]
						ifFalse: [store artifactAt: path])
				in: self]
		ifFalse:
			[(self unloadedArtifacts includesKey: path)
				ifFalse: [^ (KeyNotFound key: path) signal].
			artifact := SquotUnloadedArtifact
				wrapping: (aSquotArtifactModification hasChanges
					ifTrue: [self unloadedArtifacts at: path put: aSquotArtifactModification right]
					ifFalse: [self unloadedArtifacts at: path])
				in: self.
			"After patching the artifact, check whether it shall also be loaded now."
			aSquotArtifactModification willBeLoaded ifTrue: [artifact := artifact load]].
	^ artifact