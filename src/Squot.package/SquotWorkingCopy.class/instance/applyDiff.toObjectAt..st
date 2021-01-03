patching
applyDiff: aSquotArtifactModification toObjectAt: path
	| artifact |
	(store includesObjectAt: path)
		ifTrue: [artifact := SquotLoadedArtifact wrapping: (store applyDiff: aSquotArtifactModification) in: self]
		ifFalse:
			[(self unloadedArtifacts includesKey: path)
				ifFalse: [^ (KeyNotFound key: path) signal].
			artifact := SquotUnloadedArtifact wrapping: (self unloadedArtifacts at: path put: aSquotArtifactModification right) in: self].
	"After patching the artifact, check whether it shall also be loaded now."
	(aSquotArtifactModification willBeLoaded and: [artifact isLoaded not])
		ifTrue: [artifact := artifact load].
	^ artifact