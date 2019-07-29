accessing
conflicts
	^ Set new
		addAll: containerConflicts;
		addAll: objectConflicts;
		addAll: loadOrderConflicts;
		yourself