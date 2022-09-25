instance creation
base: baseSnapshot working: workingSnapshot incoming: incomingSnapshot merges: mergesCollection additions: additionsCollection removals: removalsCollection conflicts: conflictsCollection loadOrderMerge: loadOrderMerge metadataMerge: aMetadataMerge
	^ self new
		setBase: baseSnapshot working: workingSnapshot incoming: incomingSnapshot 
		merges: mergesCollection
		additions: additionsCollection
		removals: removalsCollection
		conflicts: conflictsCollection
		loadOrderMerge: loadOrderMerge
		metadataMerge: aMetadataMerge;
		updateResult;
		yourself