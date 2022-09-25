instance creation
merge: incomingSnapshot into: workingSnapshot basedOn: baseSnapshot  merges: mergesCollection additions: additionsCollection removals: removalsCollection conflicts: conflictsCollection
	^ self new
		setBase: baseSnapshot
		working: workingSnapshot
		incoming: incomingSnapshot
		merges: mergesCollection
		additions: additionsCollection
		removals: removalsCollection
		conflicts: conflictsCollection;
		updateResult;
		yourself