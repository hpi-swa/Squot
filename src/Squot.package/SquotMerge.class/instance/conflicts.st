accessing
conflicts
	^ super conflicts
		addAll: loadOrderMerge conflicts;
		yourself