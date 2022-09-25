accessing
updateResult
	| store |
	metadataMerge updateResult.
	elementMerges do: [:each | each updateResult].
	loadOrderMerge resetAppliedDiffs.
	(containerModifications select: [:each | each mayAffectArtifact]) do:
		[:each |
		"Confirm additions and removals for the load order."
		loadOrderMerge applyDiff: each].
	(containerConflicts select: [:each | each isResolved and: [each mayAffectArtifact]]) do:
		[:each |
		"Artifacts might be readded even though they were removed from the working copy previously."
		loadOrderMerge applyDiff: each resolution].
	loadOrderMerge updateResult.
	store := SquotSnapshotStore project: working project copy artifactSnapshots: #().
	store applyMerge: self.
	result := store snapshot.