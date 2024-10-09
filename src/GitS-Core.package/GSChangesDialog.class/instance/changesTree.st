accessing
changesTree
	^ changesTree ifNil: [changesTree := self computeChangesTree]