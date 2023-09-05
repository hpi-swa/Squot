accessing
computeChangesTree
	^ SquotChangesTree new
		addAll: self changesParts;
		yourself