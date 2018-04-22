accessing
selectionTracked: aNumber

	aNumber ~= 1 ifTrue: [
		selectionTracked := aNumber.
		self changed: #selectionTracked.
		self changed: #hasTrackedSelection]