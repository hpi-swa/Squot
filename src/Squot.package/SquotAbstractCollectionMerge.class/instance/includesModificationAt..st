testing
includesModificationAt: key
	^ (containerConflicts includesKey: key)
		or: [(containerModifications includesKey: key)
			or: [elementMerges includesKey: key]]