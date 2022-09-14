accessing
selectionTracked: aNumber

	aNumber = 1 ifTrue: ["title" ^ self].
	
	selectionTracked := aNumber.
	self changed: #selectionTracked