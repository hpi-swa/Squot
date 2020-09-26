patching
applyDiff: aSquotArtifactModification toObjectAt: path
	(store includesObjectAt: path)
		ifTrue: [store applyDiff: aSquotArtifactModification toObjectAt: path]
		ifFalse:
			[(self unloadedArtifacts includesKey: path)
				ifFalse: [^ (KeyNotFound key: path) signal].
			self unloadedArtifacts at: path put: aSquotArtifactModification right].