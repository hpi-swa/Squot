patching
applyDiff: aSquotArtifactModification toObjectAt: path
	(store includesObjectAt: path)
		ifTrue: [store applyDiff: aSquotArtifactModification]
		ifFalse:
			[(self unloadedArtifacts includesKey: path)
				ifFalse: [^ (KeyNotFound key: path) signal].
			self unloadedArtifacts at: path put: aSquotArtifactModification right].
	"After patching the artifact, check whether it shall also be loaded now."
	(aSquotArtifactModification willBeLoaded and: [(store includesObjectAt: path) not])
		ifTrue: [(self artifactAt: path) load].