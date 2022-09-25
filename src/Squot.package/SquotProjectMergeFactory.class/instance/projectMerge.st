building
projectMerge
	loadOrderMerge := SquotLoadOrderMerge
		into: workingProjectSnapshot project artifacts keys
		merge: incomingProjectSnapshot project artifacts keys
		basedOn: baseProjectSnapshot project artifacts keys.
	^ SquotProjectMerge
		base: baseProjectSnapshot
		working: workingProjectSnapshot
		incoming: incomingProjectSnapshot
		merges: merges
		additions: additions
		removals: removals
		conflicts: conflicts
		loadOrderMerge: loadOrderMerge
		metadataMerge: metadataMerge