accessing
selectedChange: aChangeOrChangesTree
	selectedChange := aChangeOrChangesTree.
	self
		changed: #selectedChange;
		changed: #buildChange:.