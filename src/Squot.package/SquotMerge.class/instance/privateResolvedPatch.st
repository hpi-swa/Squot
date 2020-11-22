merging
privateResolvedPatch
	"Answers the patch that resulted after resolving the conflicts."
	| builder |
	builder := SquotPatch builder.
	builder startingFrom: working.
	loadOrderMerge resetAppliedDiffs.
	(containerModifications select: [:each | each mayAffectArtifact]) do:
		[:each |
		builder addDiff: each.
		"Confirm additions and removals for the load order."
		loadOrderMerge applyDiff: each].
	(containerConflicts select: [:each | each mayAffectArtifact]) do:
		[:each |
		builder addDiff: each resolution.
		"Artifacts might be readded even though they were removed from the working copy previously."
		loadOrderMerge applyDiff: each resolution].
	(elementMerges select: [:each | each mayAffectArtifact])
		do: [:each | | diff workingArtifact |
			diff := each resolvedPatch.
			workingArtifact := working artifactAt: each path.
			((workingArtifact respondsTo: #isLoaded) and: [workingArtifact isLoaded])
				ifTrue: "Restore load status because it is lost when merging modifications"
					[diff setLoadedInWorkingCopy].
			builder addDiff: diff.].
	builder newLoadOrder: (loadOrderMerge resolvedPatch applyTo: working loadOrder).
	^ builder buildPatch