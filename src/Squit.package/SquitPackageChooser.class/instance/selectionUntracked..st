accessing
selectionUntracked: aNumber

	selectionUntracked := aNumber.
	self changed: #selectionUntracked.
	self changed: #hasUntrackedSelection