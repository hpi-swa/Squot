accessing
conflictAt: key ifAbsent: aBlock
	^ containerConflicts at: key ifAbsent: aBlock