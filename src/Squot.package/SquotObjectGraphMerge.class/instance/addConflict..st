adding and removing
addConflict: aConflict
	containerConflicts at: (self keyOf: aConflict object) put: aConflict.