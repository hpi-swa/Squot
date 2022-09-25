private
applyLoadStatusToPatchArtifacts: aPatch
	SquotToggles useNewApi ifTrue: [^ self "Load status determined solely by the type of store that the working copy uses for the artifact."].
	aPatch diffsDo:
		[:each |
		(self workingCopy artifactAt: each path ifAbsent: [])
			ifNotNil: [:artifact | artifact isLoaded ifTrue: [each setLoadedInWorkingCopy]]].