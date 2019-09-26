accessing
conflictsAt: key
	^ Array with:
		(containerConflicts at: key
			ifAbsent: [^ (self mergeAt: key) conflicts])