initialize-release
setBase: baseSnapshot working: workingSnapshot incoming: incomingSnapshot merges: mergesCollection additions: additionsCollection removals: removalsCollection conflicts: conflictsCollection loadOrderMerge: aLoadOrderMerge metadataMerge: aMetadataMerge
	base := baseSnapshot.
	working := workingSnapshot.
	incoming := incomingSnapshot.
	mergesCollection do: [:each | elementMerges at: each object artifact id put: each].
	additionsCollection do: [:each | containerModifications at: each object id put: each].
	removalsCollection do: [:each | containerModifications at: each object id put: each].
	conflictsCollection do: [:each | containerConflicts at: each object artifact id put: each].
	loadOrderMerge := aLoadOrderMerge.
	metadataMerge := aMetadataMerge.