private
applyLoadStatusToPatchArtifacts: aPatch
	aPatch diffsDo:
		[:each |
		(self workingCopy artifactAt: each path ifAbsent: [])
			ifNotNil: [:artifact | artifact isLoaded ifTrue: [each setLoadedInWorkingCopy]]].