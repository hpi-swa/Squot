accessing
computeChangesTree
	^ GSChangesTree new
		addAll: self changes;
		yourself