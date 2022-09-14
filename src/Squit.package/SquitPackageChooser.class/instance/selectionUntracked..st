accessing
selectionUntracked: aNumber

	aNumber = 1 ifTrue: ["title" ^ self].
	
	selectionUntracked := aNumber.
	self changed: #selectionUntracked