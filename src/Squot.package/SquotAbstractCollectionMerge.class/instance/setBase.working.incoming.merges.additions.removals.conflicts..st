initialize-release
setBase: baseSnapshot working: workingSnapshot incoming: incomingSnapshot merges: mergesCollection additions: additionsCollection removals: removalsCollection conflicts: conflictsCollection
	base := baseSnapshot.
	working := workingSnapshot.
	incoming := incomingSnapshot.
	mergesCollection associationsDo: [:each | elementMerges at: each key put: each value].
	additionsCollection associationsDo: [:each | containerModifications at: each key put: each value].
	removalsCollection associationsDo: [:each | containerModifications at: each key put: each value].
	conflictsCollection associationsDo: [:each | containerConflicts  at: each key put: each value].