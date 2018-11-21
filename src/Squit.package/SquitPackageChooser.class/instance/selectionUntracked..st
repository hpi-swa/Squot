accessing
selectionUntracked: aNumber

	aNumber ~= 1 ifTrue: [
		selectionUntracked := aNumber.
		self changed: #selectionUntracked.
		self changed: #hasUntrackedSelection]