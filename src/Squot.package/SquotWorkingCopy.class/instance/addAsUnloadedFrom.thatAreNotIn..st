private
addAsUnloadedFrom: aVersion thatAreNotIn: previousVersionOrNil
	"Some repositories add artifacts automatically. Add these to the unloaded objects."
	| previousArtifactPaths added |
	previousArtifactPaths := previousVersionOrNil ifNotNil: [:version | version artifacts keys] ifNil: [#()].
	"Artifacts that were removed from the working copy should not be readded!"
	added := aVersion artifacts keys reject: [:each | previousArtifactPaths includes: each].
	(added reject: [:each | self includesObjectAt: each])
		do: [:each | self addUnloaded: (aVersion artifactAt: each)].