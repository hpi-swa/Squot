accessing
computeChangesTree
	^ SquotChangesTree new
		addAll: self changes;
		yourself